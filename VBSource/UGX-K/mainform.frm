VERSION 4.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "UGX v2.00 Keymaker"
   ClientHeight    =   4065
   ClientLeft      =   4020
   ClientTop       =   2010
   ClientWidth     =   4740
   Height          =   4470
   Left            =   3960
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4065
   ScaleWidth      =   4740
   Top             =   1665
   Width           =   4860
   Begin VB.CommandButton Command2 
      Caption         =   "E&xit"
      Height          =   495
      Left            =   3720
      TabIndex        =   11
      Top             =   3480
      Width           =   975
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Ok"
      Height          =   495
      Left            =   120
      TabIndex        =   10
      Top             =   3480
      Width           =   975
   End
   Begin VB.TextBox KeyBox 
      Height          =   285
      Left            =   1080
      TabIndex        =   5
      Top             =   2880
      Width           =   2775
   End
   Begin VB.TextBox SerialBox 
      Height          =   285
      Left            =   1080
      TabIndex        =   4
      Top             =   1920
      Width           =   2775
   End
   Begin VB.TextBox CompanyBox 
      Height          =   285
      Left            =   1080
      TabIndex        =   3
      Top             =   1440
      Width           =   2775
   End
   Begin VB.TextBox NameBox 
      Height          =   285
      Left            =   1080
      TabIndex        =   2
      Top             =   960
      Width           =   2775
   End
   Begin VB.Line Line6 
      X1              =   4080
      X2              =   4200
      Y1              =   2040
      Y2              =   2040
   End
   Begin VB.Line Line5 
      X1              =   3960
      X2              =   4080
      Y1              =   2040
      Y2              =   2160
   End
   Begin VB.Line Line4 
      X1              =   3960
      X2              =   4080
      Y1              =   2040
      Y2              =   1920
   End
   Begin VB.Line Line3 
      X1              =   4080
      X2              =   3960
      Y1              =   2040
      Y2              =   2040
   End
   Begin VB.Line Line2 
      X1              =   4200
      X2              =   4200
      Y1              =   2520
      Y2              =   2040
   End
   Begin VB.Line Line1 
      X1              =   3720
      X2              =   4200
      Y1              =   2520
      Y2              =   2520
   End
   Begin VB.Label Label7 
      Caption         =   "Serial # Consists of 4 Characters and 4 numbers. Eg. ABCD1234"
      Height          =   495
      Left            =   1200
      TabIndex        =   12
      Top             =   2280
      Width           =   2415
   End
   Begin VB.Label Label6 
      BackStyle       =   0  'Transparent
      Caption         =   "Your Code:"
      Height          =   255
      Left            =   120
      TabIndex        =   9
      Top             =   2880
      Width           =   855
   End
   Begin VB.Label Label5 
      BackStyle       =   0  'Transparent
      Caption         =   "Your Serial:"
      Height          =   255
      Left            =   120
      TabIndex        =   8
      Top             =   1920
      Width           =   855
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "Company:"
      Height          =   255
      Left            =   240
      TabIndex        =   7
      Top             =   1440
      Width           =   735
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "Name:"
      Height          =   255
      Left            =   480
      TabIndex        =   6
      Top             =   960
      Width           =   495
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "by --=DaRk sTAlKeR 96=--"
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
      Height          =   255
      Left            =   720
      TabIndex        =   1
      Top             =   480
      Width           =   3015
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "UGX v2.oo Keymaker"
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
      Height          =   255
      Left            =   840
      TabIndex        =   0
      Top             =   120
      Width           =   2535
   End
End
Attribute VB_Name = "Form1"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Private Sub Command1_Click()
  KeyBox.Text = MakeKey(NameBox.Text, CompanyBox.Text, SerialBox.Text)
End Sub

Function MakeKey(Name As String, Company As String, Serial As String) As String
Dim Tmp As String
Dim Tmp2 As String
Dim Tmp3 As String
Dim TheKey As String
Dim TmpStr As String
Dim CodeStr As String
Dim TheCode(9) As String
Dim CharIndex(127) As Integer
Dim X As Integer
Dim Y As Integer
Dim A As Integer
Dim B As Integer
Dim C As Integer
Dim D As Integer
Dim E As Integer
Dim TmpInt As Integer
'Begin
  If Name = "" Then
    Name = Space$(5)
  End If
  If Company = "" Then
    Company = Space$(5)
  End If
  If Serial = "" Then
    Serial = Space$(5)
  End If
  TheCode$(0) = "02031203031510051309"
  TheCode$(1) = "11040509121406031304"
  TheCode$(2) = "09020504010214131301"
  TheCode$(3) = "09140009040808071513"
  TheCode$(4) = "14080313111010081303"
  TheCode$(5) = "14150303051101101202"
  TheCode$(6) = "07011306011112031204"
  TheCode$(7) = "00031310001012090306"
  TheCode$(8) = "10050304040914151203"
  TheCode$(9) = "09090910110111071306"
  For X% = 0 To 9
    TmpStr$ = TheCode$(X%)
    For Y% = 0 To 9
      CharIndex%(X% * 10 + Y%) = Val(Mid$(TmpStr$, (Y% + 1) * 2, 2))
    Next
  Next
  CodeStr$ = "79JASPERKWOVDI23U12CY4B05HNQXFG6MT8L"
  Tmp$ = Serial + Name + Company
  A% = Asc(Mid$(Name, 2, 1))
  While A% > 36
    A% = A% - 36
  Wend
  Tmp3$ = Mid$(CodeStr$, A%, 1)
  TheKey$ = Tmp3$
  B% = Len(Tmp$) - 8 + A%
  While B% > 36
    B% = B% - 36
  Wend
  Tmp2$ = Mid$(CodeStr$, B%, 1)
  TheKey$ = TheKey$ + Tmp2$
  TmpStr$ = ""
  For X% = 1 To Len(Tmp$)
    C% = Asc(Mid$(Tmp$, X%, 1)) + CharIndex%(A%)
    If C% > 122 Then
      C% = C% - 91
    End If
    TmpStr$ = TmpStr$ + Chr$(C%)
    A% = A% + 1
    If A% > 99 Then
      A% = 0
    End If
  Next
  D% = 0
  E% = 108
  For X% = 1 To Len(TmpStr$)
    TmpInt% = Asc(Mid$(TmpStr$, X%, 1))
    D% = D% + TmpInt%
    If D% > 255 Then
      D% = D% - 256
    End If
    E% = E% Xor TmpInt%
  Next
  TheKey$ = TheKey$ + "-" + Right$("000" + Mid$(Str$(D%), 2), 3) + Right$("000" + Mid$(Str$(E%), 2), 3)
  MakeKey = TheKey$
End Function

Private Sub Command2_Click()
  End
End Sub


