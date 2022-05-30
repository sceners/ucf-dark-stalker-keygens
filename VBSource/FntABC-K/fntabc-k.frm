VERSION 4.00
Begin VB.Form FntABCk 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Font-ABC v2.0 keymaker"
   ClientHeight    =   3645
   ClientLeft      =   3375
   ClientTop       =   2055
   ClientWidth     =   4905
   Height          =   4050
   Left            =   3315
   LinkTopic       =   "FntABCk"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3645
   ScaleWidth      =   4905
   Top             =   1710
   Width           =   5025
   Begin VB.TextBox CompanyBox 
      Height          =   285
      Left            =   960
      TabIndex        =   8
      Top             =   1800
      Width           =   2895
   End
   Begin VB.TextBox KeyBox 
      Height          =   285
      Left            =   1560
      Locked          =   -1  'True
      TabIndex        =   5
      Top             =   2400
      Width           =   1695
   End
   Begin VB.TextBox NameBox 
      Height          =   285
      Left            =   960
      TabIndex        =   4
      Top             =   1320
      Width           =   2895
   End
   Begin VB.CommandButton ExitButton 
      Caption         =   "E&xit"
      Height          =   615
      Left            =   3720
      TabIndex        =   3
      Top             =   2880
      Width           =   1095
   End
   Begin VB.CommandButton OkButton 
      Caption         =   "&Ok"
      Height          =   615
      Left            =   120
      TabIndex        =   2
      Top             =   2880
      Width           =   1095
   End
   Begin VB.Label Label5 
      Caption         =   "Company:"
      Height          =   255
      Left            =   120
      TabIndex        =   9
      Top             =   1800
      Width           =   735
   End
   Begin VB.Label Label4 
      Caption         =   "Your Code:"
      Height          =   255
      Left            =   600
      TabIndex        =   7
      Top             =   2400
      Width           =   855
   End
   Begin VB.Label Label3 
      Caption         =   "Name:"
      Height          =   255
      Left            =   360
      TabIndex        =   6
      Top             =   1340
      Width           =   495
   End
   Begin VB.Label Label2 
      Caption         =   "--=DaRk sTAlKeR 96=--"
      BeginProperty Font 
         name            =   "Arial"
         charset         =   0
         weight          =   700
         size            =   12
         underline       =   0   'False
         italic          =   -1  'True
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000C0&
      Height          =   375
      Left            =   960
      TabIndex        =   1
      Top             =   600
      Width           =   2775
   End
   Begin VB.Label Label1 
      Caption         =   "Font-ABC v2.0 Keymaker by"
      BeginProperty Font 
         name            =   "Arial"
         charset         =   0
         weight          =   700
         size            =   14.25
         underline       =   0   'False
         italic          =   -1  'True
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000C0&
      Height          =   375
      Left            =   480
      TabIndex        =   0
      Top             =   120
      Width           =   3975
   End
End
Attribute VB_Name = "FntABCk"
Attribute VB_Creatable = False
Attribute VB_Exposed = False

Private Sub ExitButton_Click()
  End
End Sub

Private Sub OkButton_Click()
   KeyBox.Text = MakeKey(NameBox.Text, CompanyBox.Text)
End Sub

Function MakeKey(ByVal Name As String, ByVal City As String) As String
Dim X As Integer
Dim Tmp As String
Dim TmpCode As Double
Dim TmpName As Variant
Dim CityTmp As Variant

  For X% = 2 To Len(Name)
    TmpName = TmpName + Asc(Mid$(Name, X%, 1)) - X%
  Next X%
  For X% = 2 To Len(City)
    CityTmp = CityTmp + Asc(Mid$(City, X%, 1)) - X%
  Next X%
  TmpCode = Abs(TmpName * CityTmp)
  If TmpCode < 100000 Then
    TmpCode = TmpCode + 123456
  End If
  Tmp$ = Right$(Oct$(TmpCode), 6)
  MakeKey = Trim(Tmp$)
End Function