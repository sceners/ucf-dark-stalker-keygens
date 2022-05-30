VERSION 4.00
Begin VB.Form McRacesK 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Mutant Chicken Races v1.1 keymaker"
   ClientHeight    =   3015
   ClientLeft      =   3825
   ClientTop       =   2130
   ClientWidth     =   4905
   Height          =   3420
   Left            =   3765
   LinkTopic       =   "McRacesK"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3015
   ScaleWidth      =   4905
   Top             =   1785
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
      Caption         =   "Mutant Chicken Races v1.1 Keymaker by"
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
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   5895
   End
End
Attribute VB_Name = "McRacesK"
Attribute VB_Creatable = False
Attribute VB_Exposed = False

Private Sub ExitButton_Click()
  End
End Sub

Private Sub OkButton_Click()
  If NameBox.Text <> "" Then
   KeyBox.Text = MakeKey(NameBox.Text)
  Else
   MsgBox "I think entering a name would help."
  End If
End Sub

Function MakeKey(Name As String) As String
Dim l012A As String ' Variant
Dim l0130 As String * 255
Dim l0132() As Integer
Dim l0138
  ReDim l0132(3) As Integer
   Name = RTrim(Name)
   Do While (Len(Name) < 15)
     Name = Name + "Z"
   Loop
   Name = UCase$(Name)
   l012A = ""
   l0132(0) = Asc(Mid(Name, 1, 1))
   l0132(1) = Asc(Mid(Name, 2, 1))
   l0132(2) = Asc(Mid(Name, 8, 1))
   l0132(1) = Int(l0132(0) / l0132(1)) + l0132(2)
   l012A = RTrim(Str(l0132(1)))
   l0132(0) = Asc(Mid(Name, 6, 1))
   l0132(1) = Asc(Mid(Name, 4, 1))
   l0132(2) = Asc(Mid(Name, 12, 1))
   l0132(1) = l0132(0) + l0132(1) * l0132(2)
   l0130 = RTrim(Str(l0132(1)))
   l012A = Trim(l012A) + Trim(l0130)
   l0132(0) = Asc(Mid(Name, 2, 1))
   l0132(1) = Asc(Mid(Name, 9, 1))
   l0132(2) = Asc(Mid(Name, 10, 1))
   l0132(1) = l0132(0) + l0132(1) + l0132(2) + l0132(2) + l0132(1)
   l0130 = RTrim(Str(l0132(1)))
   l012A = Trim(l012A) + Trim(l0130)
   For l0138 = 1 To Len(l012A)
     If (Mid(l012A, l0138, 1) = "-") Then l012A = Mid(l012A, 1, l0138 - 1) + Mid(l012A, l0138 + 1, Len(l012A))
   Next l0138
  MakeKey = Trim(RTrim(l012A))
End Function

