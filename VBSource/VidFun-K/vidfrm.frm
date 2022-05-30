VERSION 4.00
Begin VB.Form VidFrm 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "VidFun v1.6 keymaker"
   ClientHeight    =   3030
   ClientLeft      =   3795
   ClientTop       =   2715
   ClientWidth     =   4905
   Height          =   3435
   Left            =   3735
   LinkTopic       =   "VidFrm"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3030
   ScaleWidth      =   4905
   Top             =   2370
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
      Caption         =   "VidFun v1.6 Keymaker by"
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
      Left            =   600
      TabIndex        =   0
      Top             =   120
      Width           =   3735
   End
End
Attribute VB_Name = "VidFrm"
Attribute VB_Creatable = False
Attribute VB_Exposed = False

Private Sub ExitButton_Click()
  End
End Sub

Private Sub OkButton_Click()
  If NameBox.Text <> "" Then
    KeyBox.Text = Trim$(Str$(MakeKey(NameBox.Text)))
  Else
    MsgBox "I think a name would help."
  End If
End Sub

Function MakeKey(Name As String) As Double
Dim NameLen As Integer
Dim Tmp As Double
Dim l01B8 As Single
Dim l01BA As Single
Dim l01BC As Single
Dim l01BE As Single
Dim l01C0 As Single
Dim X
Dim l01C4 As Integer

  NameLen = Len(Name)
  For X = 1 To NameLen
    l01C4 = (Asc(Mid$(Name, X, 1)) Or 1) And 85
    l01B8! = l01B8! + l01C4
  Next
  l01C0! = (l01B8! And 15) + 2.3
  l01B8! = CLng(l01B8! * 3.4)
  For X = 1 To NameLen
    l01C4 = (Asc(Mid$(Name, X, 1)) Or 128) And 170
    l01BA! = l01BA! + l01C4
  Next
  l01BA! = CLng(l01BA! * 5.6)
  l01BC! = (CLng(l01B8!) And 32767)
  If l01BC! < 16384 Then l01BC! = l01BC! * -2.3
  l01BE! = (CLng(l01BA!) And 32767)
  If l01BE! < 16384 Then l01BE! = l01BE! * 234.4
  Tmp = CDbl(l01BC!) * CDbl(l01BE!)
  If Tmp < 0 Then Tmp = Tmp * -1
  Do While Tmp > 999999999
    Tmp = Tmp / l01C0!
  Loop
  MakeKey = CLng(Tmp)
End Function
