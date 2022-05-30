VERSION 4.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "UBX v2.00w Keymaker"
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
      Caption         =   "UBX v2.00w Keymaker"
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
      Left            =   960
      TabIndex        =   0
      Top             =   120
      Width           =   2655
   End
End
Attribute VB_Name = "Form1"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Private Sub Command1_Click()
  KeyBox.Text = MakeKey(NameBox.Text, CompanyBox.Text, SerialBox.Text)
End Sub

Function MakeKey(Name As String, Company As String, Serial As String) As String
Dim Table(127) As Integer
Dim TheKey(9) As String
Dim X As Integer
Dim Y As Integer
Dim Tmp As String
Dim Key2 As String
Dim Tmp2 As String
Dim Temp1 As Integer
Dim Tmp3 As String
Dim RealKey As String
Dim Tmp4 As Integer
Dim Tmp5 As String
Dim Temp As Integer
Dim Idx As Integer
Dim Cntr As Integer
Dim Cnt As Integer
  TheKey$(0) = "02031203031510051309"
  TheKey$(1) = "11040509121406031304"
  TheKey$(2) = "09020504010214131301"
  TheKey$(3) = "09140009040808071513"
  TheKey$(4) = "14080313111010081303"
  TheKey$(5) = "14150303051101101202"
  TheKey$(6) = "07011306011112031204"
  TheKey$(7) = "00031310001012090306"
  TheKey$(8) = "10050304040914151203"
  TheKey$(9) = "09090910110111071306"
  For X% = 0 To 9
    Tmp$ = TheKey$(X%)
    For Y% = 0 To 9
      Table%(X% * 10 + Y%) = Val(Mid$(Tmp$, (Y% + 1) * 2, 2))
    Next
  Next
  Key2$ = "79JASPERKWOVDI23U12CY4B05HNQXFG6MT8L"
  Tmp2$ = Serial + Name + Company
  Temp1% = Asc(Mid$(Name, 2, 1))
  While Temp1% > 36
    Temp1% = Temp1% - 36
  Wend
  Tmp3$ = Mid$(Key2$, Temp1%, 1)
  RealKey$ = Tmp3$
  Tmp4% = Len(Tmp2$) - 8 + Temp1%
  While Tmp4% > 36
    Tmp4% = Tmp4% - 36
  Wend
  Tmp5$ = Mid$(Key2$, Tmp4%, 1)
    RealKey$ = RealKey$ + Tmp5$
  Tmp$ = ""
  For X% = 1 To Len(Tmp2$)
    Temp% = Asc(Mid$(Tmp2$, X%, 1)) + Table%(Temp1%)
    If Temp% > 122 Then
      Temp% = Temp% - 91
    End If
    Tmp$ = Tmp$ + Chr$(Temp%)
    Temp1% = Temp1% + 1
    If Temp1% > 99 Then
      Temp1% = 0
    End If
  Next
  Idx% = 0
  Cntr% = 108
  For X% = 1 To Len(Tmp$)
    Cnt% = Asc(Mid$(Tmp$, X%, 1))
    Idx% = Idx% + Cnt%
    If Idx% > 255 Then
        Idx% = Idx% - 256
    End If
    Cntr% = Cntr% Xor Cnt%
  Next
  RealKey$ = RealKey$ + "-" + Right$("000" + Mid$(Str$(Idx%), 2), 3) + Right$("000" + Mid$(Str$(Cntr%), 2), 3)
  MakeKey = RealKey
End Function

Private Sub Command2_Click()
  End
End Sub
