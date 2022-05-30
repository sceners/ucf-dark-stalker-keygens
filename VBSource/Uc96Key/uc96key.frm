VERSION 4.00
Begin VB.Form Uc96Key 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Unit Conversion 96 keymaker"
   ClientHeight    =   2655
   ClientLeft      =   4185
   ClientTop       =   2115
   ClientWidth     =   4650
   Height          =   3060
   Left            =   4125
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2655
   ScaleWidth      =   4650
   Top             =   1770
   Width           =   4770
   Begin VB.CommandButton Command2 
      Caption         =   "&Ok"
      Height          =   495
      Left            =   3720
      TabIndex        =   7
      Top             =   2100
      Width           =   855
   End
   Begin VB.CommandButton Command1 
      Caption         =   "E&xit"
      Height          =   495
      Left            =   120
      TabIndex        =   4
      Top             =   2100
      Width           =   855
   End
   Begin VB.TextBox KeyBox 
      Height          =   285
      Left            =   1080
      TabIndex        =   3
      Top             =   1560
      Width           =   2655
   End
   Begin VB.TextBox NameBox 
      Height          =   285
      Left            =   1080
      TabIndex        =   2
      Top             =   1080
      Width           =   2655
   End
   Begin VB.Label Label4 
      Caption         =   "Your Key:"
      Height          =   255
      Left            =   240
      TabIndex        =   6
      Top             =   1560
      Width           =   735
   End
   Begin VB.Label Label3 
      Caption         =   "Name:"
      Height          =   255
      Left            =   480
      TabIndex        =   5
      Top             =   1080
      Width           =   615
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
      Top             =   480
      Width           =   2655
   End
   Begin VB.Label Label1 
      Caption         =   "Unit Conversion 96 keymaker"
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
      Left            =   480
      TabIndex        =   0
      Top             =   120
      Width           =   3615
   End
End
Attribute VB_Name = "Uc96Key"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Private Sub Command1_Click()
  End
End Sub


Private Sub Command2_Click()
  If Len(NameBox.Text) <> 0 Then
    KeyBox.Text = MakeKey(NameBox.Text)
  End If
End Sub
Function MakeKey(Name As String) As String
Dim Key As String
  Key = Format$((Asc(Name) - 30)) + Format$((Asc(Mid(Name, 2, 1)) + 2)) + Format$((Asc(Mid(Name, 3, 1)) + 3)) + Format$((Asc(Mid(Name, 4, 1)) + 11)) + Format$((Asc(Right(Name, 1)) * 2))
  MakeKey = Key
End Function


