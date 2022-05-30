VERSION 4.00
Begin VB.Form KeyForm 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Empire IV v3.01 Win95/Win31 keymaker"
   ClientHeight    =   5145
   ClientLeft      =   3900
   ClientTop       =   1905
   ClientWidth     =   4905
   Height          =   5550
   Left            =   3840
   LinkTopic       =   "Ftoolsk"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5145
   ScaleWidth      =   4905
   ShowInTaskbar   =   0   'False
   Top             =   1560
   Width           =   5025
   Begin VB.TextBox RunCodeBox 
      Height          =   285
      Left            =   1560
      TabIndex        =   6
      Top             =   1200
      Width           =   1695
   End
   Begin VB.TextBox KeyBox 
      Height          =   285
      Left            =   1320
      Locked          =   -1  'True
      TabIndex        =   4
      Top             =   3960
      Width           =   1935
   End
   Begin VB.CommandButton ExitButton 
      Caption         =   "E&xit"
      Height          =   615
      Left            =   3720
      TabIndex        =   3
      Top             =   4440
      Width           =   1095
   End
   Begin VB.CommandButton OkButton 
      Caption         =   "&Ok"
      Height          =   615
      Left            =   120
      TabIndex        =   2
      Top             =   4440
      Width           =   1095
   End
   Begin VB.Label Label6 
      Caption         =   $"empivk.frx":0000
      Height          =   2055
      Left            =   1080
      TabIndex        =   8
      Top             =   1560
      Width           =   2415
   End
   Begin VB.Line Line5 
      X1              =   3480
      X2              =   3600
      Y1              =   1320
      Y2              =   1440
   End
   Begin VB.Line Line4 
      X1              =   3480
      X2              =   3600
      Y1              =   1320
      Y2              =   1200
   End
   Begin VB.Line Line3 
      X1              =   4080
      X2              =   3600
      Y1              =   1800
      Y2              =   1800
   End
   Begin VB.Line Line2 
      X1              =   4080
      X2              =   4080
      Y1              =   1320
      Y2              =   1800
   End
   Begin VB.Line Line1 
      X1              =   3480
      X2              =   4080
      Y1              =   1320
      Y2              =   1320
   End
   Begin VB.Label Label5 
      Caption         =   "Run Code:"
      Height          =   255
      Left            =   600
      TabIndex        =   7
      Top             =   1200
      Width           =   855
   End
   Begin VB.Label Label4 
      Caption         =   "Your Code:"
      Height          =   255
      Left            =   360
      TabIndex        =   5
      Top             =   3960
      Width           =   855
   End
   Begin VB.Label Label2 
      Caption         =   "--=DaRk sTAlKeR 97=-- [UCF]"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000C0&
      Height          =   375
      Left            =   720
      TabIndex        =   1
      Top             =   600
      Width           =   3375
   End
   Begin VB.Label Label1 
      Caption         =   "Empire IV Win95/Win31 Keygen by"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000C0&
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4575
   End
End
Attribute VB_Name = "KeyForm"
Attribute VB_Creatable = False
Attribute VB_Exposed = False

Private Sub ExitButton_Click()
  KeyForm.Visible = False
  HowTo.Show
End Sub

Private Sub OkButton_Click()
 If Len(RunCodeBox.Text) <= 0 Then
   MsgBox "Enter a runcode stupid ;)"
   Exit Sub
 End If
 If Len(RunCodeBox.Text) < 12 Then
   MsgBox "Invalid runcode!"
   Exit Sub
 End If
 KeyBox = MakeKey(RunCodeBox.Text)
End Sub

Function MakeKey(RunCode As String) As String
Dim l0442 As Long
Dim l0444 As Long
Dim l0446 As Long
Dim l0448 As Long
Dim Code As String
  l0442& = Val(Left$(RunCode$, 5))
  l0444& = Asc(Mid$(RunCode$, 12)) \ 2
  l0442& = l0442& * l0444&
  l0446& = Val(Mid$(RunCode$, 7, 2))
  l0444& = Asc(Mid$(RunCode$, 14)) * 2
  l0446& = l0446& * l0444&
  l0448& = Val(Mid$(RunCode$, 9, 2))
  l0444& = Asc(Mid$(RunCode$, 13)) \ 3
  l0448& = l0448& * l0444&
  Code$ = Trim$(Str$(l0446&)) + Trim$(Str$(l0442&)) + Trim$(Str$(l0448&))
  MakeKey$ = Code$
End Function
