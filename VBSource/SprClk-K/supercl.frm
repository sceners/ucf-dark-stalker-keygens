VERSION 4.00
Begin VB.Form SuperCl 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Super Clock v2.10 keymaker"
   ClientHeight    =   3030
   ClientLeft      =   3765
   ClientTop       =   2505
   ClientWidth     =   4905
   Height          =   3435
   Left            =   3705
   LinkTopic       =   "SuperCl"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3030
   ScaleWidth      =   4905
   Top             =   2160
   Width           =   5025
   Begin VB.TextBox KeyBox 
      Height          =   285
      Left            =   1680
      Locked          =   -1  'True
      TabIndex        =   5
      Top             =   1680
      Width           =   1695
   End
   Begin VB.TextBox NameBox 
      Height          =   285
      Left            =   1080
      TabIndex        =   4
      Top             =   1080
      Width           =   2895
   End
   Begin VB.CommandButton ExitButton 
      Caption         =   "E&xit"
      Height          =   615
      Left            =   3720
      TabIndex        =   3
      Top             =   2280
      Width           =   1095
   End
   Begin VB.CommandButton OkButton 
      Caption         =   "&Ok"
      Height          =   615
      Left            =   120
      TabIndex        =   2
      Top             =   2280
      Width           =   1095
   End
   Begin VB.Label Label4 
      Caption         =   "Your Code:"
      Height          =   255
      Left            =   720
      TabIndex        =   7
      Top             =   1680
      Width           =   855
   End
   Begin VB.Label Label3 
      Caption         =   "Name:"
      Height          =   255
      Left            =   480
      TabIndex        =   6
      Top             =   1080
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
      Caption         =   "Super Clock v2.10 Keymaker by"
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
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4575
   End
End
Attribute VB_Name = "SuperCl"
Attribute VB_Creatable = False
Attribute VB_Exposed = False

Private Sub ExitButton_Click()
  End
End Sub

Private Sub OkButton_Click()
  If Len(NameBox.Text) <> 0 Then
    KeyBox.Text = MakeKey(NameBox.Text)
  Else
    MsgBox "I think a name would help."
  End If
End Sub

Function MakeKey(Name As String) As String
Dim l00AA As Double
Dim l00AC As String
Dim l00B0 As String
  l00AA# = Asc(Left(Name$, 1))
  l00AC$ = Left(Name$, 5)
  l00AA# = l00AA# * (Asc(Right(l00AC$, 1)))
  l00AA# = (l00AA# - 2) / 5 - (14 + 1994)
  l00AA# = Int(l00AA#)
  l00AA# = l00AA# * 950
  l00B0$ = Cnv(l00AA#) & ";"
  l00AA# = 9 * 8 + Asc(Right(Name$, 1))
  l00B0$ = l00B0$ & Cnv(l00AA#) & ";"
  l00AA# = (98 * 3) + (867 - 348)
  l00AC$ = Right(Name$, 4)
  l00AA# = l00AA# * (Asc(Left(l00AC$, 1))) / 12
  l00AA# = Int(l00AA#)
  l00B0$ = l00B0$ & Cnv(l00AA#)
  MakeKey$ = l00B0$
End Function

Function Cnv(St As Variant) As String
Dim l00FC As String
Dim l00FE As Integer
Dim l0100 As String
Dim l0102 As Single
  l0102! = CSng(St)
  l00FC$ = Str$(l0102!)
  l00FE% = Len(l00FC$) - 1
  l0100$ = Right$(l00FC$, l00FE%)
  Cnv = l0100$
End Function
