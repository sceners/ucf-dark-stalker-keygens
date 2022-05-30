VERSION 4.00
Begin VB.Form LSrch6k 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Legal Searcher v6.0 keymaker"
   ClientHeight    =   3105
   ClientLeft      =   3390
   ClientTop       =   1935
   ClientWidth     =   4905
   Height          =   3510
   Left            =   3330
   LinkTopic       =   "LSrch6k"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3105
   ScaleWidth      =   4905
   Top             =   1590
   Width           =   5025
   Begin VB.TextBox KeyBox 
      Height          =   285
      Left            =   1560
      Locked          =   -1  'True
      TabIndex        =   5
      Top             =   1920
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
      Top             =   2400
      Width           =   1095
   End
   Begin VB.CommandButton OkButton 
      Caption         =   "&Ok"
      Height          =   615
      Left            =   120
      TabIndex        =   2
      Top             =   2400
      Width           =   1095
   End
   Begin VB.Label Label4 
      Caption         =   "Your Code:"
      Height          =   255
      Left            =   600
      TabIndex        =   7
      Top             =   1935
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
      Left            =   1080
      TabIndex        =   1
      Top             =   600
      Width           =   2775
   End
   Begin VB.Label Label1 
      Caption         =   "Legal Searcher v6.0  Keymaker by"
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
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   4455
   End
End
Attribute VB_Name = "LSrch6k"
Attribute VB_Creatable = False
Attribute VB_Exposed = False

Private Sub ExitButton_Click()
  End
End Sub

Private Sub OkButton_Click()
  KeyBox.Text = MakeKey(NameBox.Text)
End Sub

Function MakeKey(Name As String) As Long
Dim X
Dim Tmp As Integer
Dim TmpKey As Long
Dim TmpName As String

  TmpKey = 0
  TmpName = LCase$(Name)
  For X = 1 To Len(TmpName)
    Tmp = Asc(Mid$(TmpName, X, 1))
    If Tmp <> 32 Then
      If Int(X / 2) = X / 2 Then
        Tmp = Tmp * 2
      End If
      TmpKey = TmpKey + Tmp
    End If
  Next X
  MakeKey = TmpKey
End Function
