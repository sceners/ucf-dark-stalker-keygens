VERSION 4.00
Begin VB.Form MainForm 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Icon Vacuum v1.7 Keymaker"
   ClientHeight    =   2640
   ClientLeft      =   3570
   ClientTop       =   2370
   ClientWidth     =   4020
   BeginProperty Font 
      name            =   "MS Sans Serif"
      charset         =   0
      weight          =   700
      size            =   8.25
      underline       =   0   'False
      italic          =   0   'False
      strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000008&
   Height          =   3045
   Left            =   3510
   LinkTopic       =   "Form1"
   ScaleHeight     =   2640
   ScaleWidth      =   4020
   Top             =   2025
   Width           =   4140
   Begin Threed.SSPanel Panel3D1 
      Height          =   2655
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   4020
      _Version        =   65536
      _ExtentX        =   7091
      _ExtentY        =   4683
      _StockProps     =   15
      BackColor       =   12632256
      BevelOuter      =   0
      Begin VB.TextBox KeyBox 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1200
         TabIndex        =   6
         Top             =   1440
         Width           =   1815
      End
      Begin VB.TextBox NameBox 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1200
         TabIndex        =   5
         Top             =   960
         Width           =   2295
      End
      Begin VB.CommandButton Command2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "E&xit"
         Height          =   495
         Left            =   2400
         TabIndex        =   4
         Top             =   1920
         Width           =   855
      End
      Begin VB.CommandButton Command1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "&Ok"
         Height          =   495
         Left            =   840
         TabIndex        =   3
         Top             =   1920
         Width           =   855
      End
      Begin VB.Label Label4 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Your Code:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   150
         TabIndex        =   8
         Top             =   1440
         Width           =   975
      End
      Begin VB.Label Label3 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Your Name:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   960
         Width           =   1095
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "-=DaRk sTAlKeR 96=-"
         BeginProperty Font 
            name            =   "Arial"
            charset         =   0
            weight          =   700
            size            =   10.5
            underline       =   0   'False
            italic          =   -1  'True
            strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000040C0&
         Height          =   255
         Left            =   960
         TabIndex        =   2
         Top             =   360
         Width           =   2175
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Icon Vacuum v1.7 Keymaker"
         BeginProperty Font 
            name            =   "Arial"
            charset         =   0
            weight          =   700
            size            =   10.5
            underline       =   0   'False
            italic          =   -1  'True
            strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000C0&
         Height          =   255
         Left            =   600
         TabIndex        =   1
         Top             =   120
         Width           =   2895
      End
   End
End
Attribute VB_Name = "MainForm"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Private Sub Command1_Click()
  If (Len(NameBox.Text) <> 0) Then
    KeyBox.Text = MakeKey((NameBox.Text), "iv")
  End If
End Sub



Private Sub Command2_Click()
  End
End Sub

Private Sub Command3D2_Click()
  Close
End Sub

Private Function MakeKey(CdName As String, ByVal KeyType As String) As String
   CdName$ = UCase$(CdName$ & "QUICKLAZYDOG")
   CdName$ = Mid$(StripDups$(StripSpaces$(CdName$)), 1, 10)
   CdName$ = MakeNumber$(CdName$)
   Select Case KeyType$
   Case "hf"
        MakeKey = LTrim$(Str$(CLng(Sqr(Val(CdName$)) * 42)))
   Case "iv"
        MakeKey = LTrim$(Str$(CLng(Sqr(Val(CdName$) * 2) * 24 + 100000)))
   Case "mm"
        MakeKey = LTrim$(Str$(CLng(Sqr((Val(CdName$) * 42)) * 3 / 2 + 23)))
   End Select
End Function

Private Function MakeNumber(ByVal St As String) As String
Dim Tmp1 As String
Dim NArr() As Integer
Dim X1 As Integer
Dim X2 As Integer
Dim X3 As Integer
Dim X4 As Integer
Dim Tmp2 As String
    Tmp1 = "2174629103"
    ReDim NArr(9) As Integer
    For X1% = 1 To Len(St$)
        For X2% = 1 To Len(St$)
            If Mid$(St$, X2%, 1) > Mid$(St$, X1%, 1) Then
                NArr(X2% - 1) = NArr(X2% - 1) + 1
            End If
        Next
    Next
    For X3% = 0 To 9
        NArr(X3%) = NArr(X3%) + Val(Mid$(Tmp1$, X3% + 1, 1))
    Next
    For X4% = 0 To 9
        Tmp2$ = Tmp2$ & Str$(NArr(X4%))
    Next
    MakeNumber$ = StripSpaces$(Tmp2$)
End Function

Private Function StripDups(ByVal St As String) As String
Dim X As Integer
Dim Tmp As String
    For X% = 1 To Len(St$)
        If InStr(Tmp$, Mid$(St$, X%, 1)) = 0 Then
           Tmp$ = Tmp$ & Mid$(St$, X%, 1)
        End If
    Next
    StripDups$ = Tmp$
End Function

Private Function StripSpaces(St As String) As String
Dim X As Integer
Dim Tmp As String
    For X% = 1 To Len(St$)
        If Mid$(St$, X%, 1) <> Chr$(32) Then
            Tmp$ = Tmp$ & Mid$(St$, X%, 1)
        End If
    Next
    StripSpaces$ = Tmp$
End Function

