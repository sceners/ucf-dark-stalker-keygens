VERSION 4.00
Begin VB.Form Cheat3k 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Cheat v3.00 keymaker"
   ClientHeight    =   4665
   ClientLeft      =   3870
   ClientTop       =   1860
   ClientWidth     =   4905
   Height          =   5070
   Left            =   3810
   LinkTopic       =   "Cheat3k"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4665
   ScaleWidth      =   4905
   Top             =   1515
   Width           =   5025
   Begin VB.TextBox PhoneBox 
      Height          =   285
      Left            =   1680
      TabIndex        =   12
      Top             =   2760
      Width           =   2895
   End
   Begin VB.TextBox CityBox 
      Height          =   285
      Left            =   1680
      TabIndex        =   10
      Top             =   2280
      Width           =   2895
   End
   Begin VB.TextBox AddressBox 
      Height          =   285
      Left            =   1680
      TabIndex        =   8
      Top             =   1800
      Width           =   2895
   End
   Begin VB.TextBox KeyBox 
      Height          =   285
      Left            =   1680
      Locked          =   -1  'True
      TabIndex        =   5
      Top             =   3480
      Width           =   1695
   End
   Begin VB.TextBox NameBox 
      Height          =   285
      Left            =   1680
      TabIndex        =   4
      Top             =   1320
      Width           =   2895
   End
   Begin VB.CommandButton ExitButton 
      Caption         =   "E&xit"
      Height          =   615
      Left            =   3600
      TabIndex        =   3
      Top             =   3960
      Width           =   1095
   End
   Begin VB.CommandButton OkButton 
      Caption         =   "&Ok"
      Height          =   615
      Left            =   120
      TabIndex        =   2
      Top             =   3960
      Width           =   1095
   End
   Begin VB.Label Label7 
      Caption         =   "Phone #:"
      Height          =   255
      Left            =   880
      TabIndex        =   13
      Top             =   2760
      Width           =   735
   End
   Begin VB.Label Label6 
      Caption         =   "City, State, And  Zip:"
      Height          =   255
      Left            =   120
      TabIndex        =   11
      Top             =   2280
      Width           =   1455
   End
   Begin VB.Label Label5 
      Caption         =   "Address:"
      Height          =   255
      Left            =   960
      TabIndex        =   9
      Top             =   1800
      Width           =   615
   End
   Begin VB.Label Label4 
      Caption         =   "Your Code:"
      Height          =   255
      Left            =   720
      TabIndex        =   7
      Top             =   3480
      Width           =   855
   End
   Begin VB.Label Label3 
      Caption         =   "Name:"
      Height          =   255
      Left            =   1080
      TabIndex        =   6
      Top             =   1320
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
      Caption         =   "Cheat v3.00 Keymaker by"
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
      Width           =   3615
   End
End
Attribute VB_Name = "Cheat3k"
Attribute VB_Creatable = False
Attribute VB_Exposed = False

Private Sub ExitButton_Click()
  End
End Sub

Private Sub OkButton_Click()
   KeyBox.Text = MakeKey(NameBox.Text, AddressBox.Text, CityBox.Text, PhoneBox.Text)
End Sub

Function MakeKey(Name As String, Address As String, City As String, Phone As String) As Integer
Dim Tmp As Variant
  Tmp = (Len(Name$) + 11) * 2.6
  Tmp = Tmp + (Len(Address$) + 1) * 8.6
  Tmp = Tmp + (Asc(Left$(Address$, 1)) + 1) * 67
  Tmp = Tmp + (Len(City$) + 1) * 0.6
  Tmp = Tmp + (Len(Phone$) - 1) * 0.345
  MakeKey = Int(Tmp)
End Function
