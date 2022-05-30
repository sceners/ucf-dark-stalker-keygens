Code     Segment Byte Public
Assume   Cs:Code,Ds:Code
Org      100h
P386

 Start:
  Lea    Dx,Intro
  Call   Print
  Mov    Ah,0Ah
  Lea    Dx,KbdIn
  Int    21h
  Lea    Dx,CrLf
  Call   Print
  Cmp    StrLen,0
  Ja     Short MakeKey
  Lea    Dx,Empty
  Jmp    Short Print

WriteDecimal Proc
  Test   EAx,80000000h
  Je     Short NoNeg
  Neg    EAx
  Push   Ax
  Mov    Al,'-'
  Int    29h
  Pop    Ax
 NoNeg:
  Xor    EBx,EBx
  Mov    Bl,10
  Xor    Cx,Cx
 Lp1:
  Xor    EDx,EDx
  Div    EBx
  Push   Dx
  Inc    Cx
  Or     Ax,Ax
  Jne    Short Lp1
 Lp2:
  Pop    Ax
  Add    Al,'0'
  Int    29h
  Loop   Lp2
  Ret
WriteDecimal EndP

Print Proc
  Mov    Ah,9
  Int    21h
  Ret
Print EndP

MakeKey Proc
  Mov    Di,1
  Lea    Si,TName
 CrLp:
  Xor    Ax,Ax
  LodSb
  Cmp    Al,'a'
  Jb     Short IsLow
  Cmp    Al,'z'
  Ja     Short IsLow
  Sub    Al,20h
 IsLow:
  Cmp    Al,20h
  Jne    Short NotSpc
  Mov    Di,1
  Jmp    Short CheckIt
 NotSpc:
  Cmp    Al,'A'
  Jb     Short NotUp
  Cmp    Al,'Z'
  Ja     Short NotUp
  Mov    Bx,Ax
  Mov    Ax,Di
  Shl    Ax,1
  Add    Ax,Di
  XChg   Ax,Dx
  Mov    Ax,Bx
  Add    Ax,Dx
  Call   Misc1
  Jmp    Short UpIt
 NotUp:
  Mov    Ax,di
  Shl    Ax,1
  Add    Ax,Di
  Call   Misc1
 UpIt:
  Inc    Di
 CheckIt:
  Push   Ax
  Xor    Ax,Ax
  Mov    Al,StrLen
  Mov    Bx,Si
  Sub    Bx,OffSet TName
  Cmp    Ax,Bx
  Pop    Ax
  Ja     Short CrLp
  Lea    Dx,TheKey
  Call   Print
  Mov    EAx,DWord Ptr Num2
  Call   WriteDecimal
  Lea    Dx,CrLf
  Jmp    Short Print
MakeKey EndP

Misc1 Proc
  Cwd
  XChg   Ax,Bx
  XChg   Dx,Cx
  Mov    Dl,8
  Mov    Ax,0FCB6h
  Call   Sub_1
  Add    Num2,Ax
  Adc    Num1,Dx
  Ret
Misc1 EndP

Sub_1 Proc
  Push   Si
  XChg   Ax,Si
  XChg   Ax,Dx
  Test   Ax,Ax
  Jz     Short Loc_5
  Mul    Bx
  JCxZ   Short Loc_6
 Loc_5:
  XChg   Ax,Cx
  Mul    Si
  Add    Ax,Cx
 Loc_6:
  XChg   Ax,Si
  Mul    Bx
  Add    Dx,Si
  Pop    Si
  Ret
Sub_1 EndP

  Intro  Db 13,10
         Db 'SinkSub Pro v1.01  *KeyGen* c0ded bY Dark Stalker / UCF (12/29/96)'
         Db 13,10,13,10
         Db 'Enter your name : $'
  TheKey Db 'Your key is     : $'
  Empty  Db 13,10
         Db 'Entering a name would *really* help :)'
  CrLf   Db 13,10,'$'
  Num2   Dw 0
  Num1   Dw 0
 KbdIn   Equ $
  MaxLen Db 7Fh
  StrLen Db ?
  TName  Db 7Fh Dup (?)
code ends

end start
