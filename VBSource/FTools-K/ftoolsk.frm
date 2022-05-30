VERSION 4.00
Begin VB.Form FToolsk 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Fantasy Tools v2.5 keymaker"
   ClientHeight    =   3030
   ClientLeft      =   3885
   ClientTop       =   2025
   ClientWidth     =   4905
   Height          =   3435
   Left            =   3825
   LinkTopic       =   "Ftoolsk"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3030
   ScaleWidth      =   4905
   Top             =   1680
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
      Caption         =   "Fantasy Tools v2.5 Keymaker by"
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
Attribute VB_Name = "FToolsk"
Attribute VB_Creatable = False
Attribute VB_Exposed = False

Private Sub ExitButton_Click()
  End
End Sub







Private Sub OkButton_Click()
   KeyBox.Text = MakeKey(NameBox.Text)
End Sub


Function MakeKey(ByVal Name As String) As String
Dim l029A As String
Dim Tmp As Double
Dim l029E As Double
Dim l02A0 As String
Dim l02A2 As String
Dim X
Dim l02A6 As Integer
  Tmp = 1038
  For X = 1 To Len(Name$)
    Tmp = Tmp + Asc(Mid$(Name, X, 1))
  Next
  l029A$ = ""
  l02A6 = False
  For X = 1 To Len(Name$)
    l02A2$ = UCase$(Mid$(Name$, X, 1))
    If l02A2$ = "A" Or l02A2$ = "E" Or l02A2$ = "I" Or l02A2$ = "O" Or l02A2$ = "U" Then
      l029A$ = l02A2$
      l02A6 = True
    End If
  Next
  If Not l02A6 Then
    l029A$ = UCase$(Mid$(Name$, 1, 1))
  End If
  If l029A$ = "A" Then
    l029E = (10 + 1 + 1965) + 117
  ElseIf l029A$ = "E" Then
     l029E = (15 + 8 + 1964) + 117
  ElseIf l029A$ = "I" Then
     l029E = (27 + 11 + 1969) + 117
  ElseIf l029A$ = "O" Then
     l029E = (7 + 4 + 1977) + 117
  ElseIf l029A$ = "U" Then
     l029E = (30 + 11 + 1958) + 117
  Else
     l029E = (17 + 12 + 1994) + 117
  End If
  Tmp = ((Tmp * l029E / 2) - Tmp) * 2
  l02A0$ = Right$("00000000" + Trim$(Str$(Tmp)), 8)
  l029A$ = l029A$ + Mid$(l02A0$, 1, 3) + "-"
  l029A$ = l029A$ + Mid$(l02A0$, 4)
  MakeKey = l029A$
End Function

