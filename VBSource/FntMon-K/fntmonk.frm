VERSION 4.00
Begin VB.Form FntMonK 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Font Monster v3.5 keymaker"
   ClientHeight    =   2700
   ClientLeft      =   3720
   ClientTop       =   2205
   ClientWidth     =   4320
   Height          =   3105
   Left            =   3660
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2700
   ScaleWidth      =   4320
   Top             =   1860
   Width           =   4440
   Begin VB.CommandButton Command2 
      Caption         =   "E&xit"
      Height          =   495
      Left            =   2400
      TabIndex        =   7
      Top             =   2040
      Width           =   855
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Ok"
      Height          =   495
      Left            =   1080
      TabIndex        =   6
      Top             =   2040
      Width           =   855
   End
   Begin VB.TextBox KeyBox 
      Height          =   285
      Left            =   840
      TabIndex        =   4
      Top             =   1440
      Width           =   2775
   End
   Begin VB.TextBox NameBox 
      Height          =   285
      Left            =   840
      TabIndex        =   2
      Top             =   960
      Width           =   2775
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "Your Code:"
      Height          =   255
      Left            =   0
      TabIndex        =   5
      Top             =   1467
      Width           =   855
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "Name:"
      Height          =   255
      Left            =   240
      TabIndex        =   3
      Top             =   980
      Width           =   495
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "--=DaRk sTAlKeR 96=--"
      BeginProperty Font 
         name            =   "Arial"
         charset         =   0
         weight          =   700
         size            =   11.25
         underline       =   0   'False
         italic          =   -1  'True
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000C0&
      Height          =   375
      Left            =   840
      TabIndex        =   1
      Top             =   480
      Width           =   2655
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Font Monster v3.5 keymaker by"
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
      Left            =   360
      TabIndex        =   0
      Top             =   120
      Width           =   3615
   End
End
Attribute VB_Name = "FntMonK"
Attribute VB_Creatable = False
Attribute VB_Exposed = False

Private Sub Command1_Click()
  If Len(NameBox.Text) <> 0 Then
    KeyBox.Text = MakeKey(NameBox.Text)
  End If
End Sub

Function MakeKey(Name As String) As Long
Dim X
Dim TheKey As Long
Dim Tmp As Integer
  TheKey = -19
  For X = 1 To Len(Name)
    Tmp = Asc(UCase$(Mid$(Name, X, 1)))
    If Tmp <> 32 Then
      TheKey = TheKey + Tmp - (Tmp Mod 5) + (X * Tmp)
    End If
  Next X
  TheKey = (TheKey - (TheKey Mod 17)) * 3.14159
  MakeKey = TheKey
End Function

Private Sub Command2_Click()
  End
End Sub