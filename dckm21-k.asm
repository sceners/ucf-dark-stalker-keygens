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
  Ja     Short NextX
  Lea    Dx,Empty
  Jmp    Short Print
 NextX:
  Mov    Ax,6521h             ; UpperCase string function
  Xor    Ch,Ch
  Mov    Cl,StrLen
  Lea    Dx,TName
  Int    21h
  Call   MakeKey
  Lea    Dx,TheKey
  Call   Print
  Mov    EAx,DWord Ptr [Num1]
  Call   WriteDecimal
  Lea    Dx,CrLf
  Call   Print
  Mov    Ax,4C00h
  Int    21h

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
  Lea    Bx,TName
  Mov    Al,Byte Ptr [Bx]
  Cbw
  Mov    Cx,0ABh
  IMul   Cx
  Add    Ax,7D7Fh
  Adc    Dx,3Fh
  Mov    Num1,Ax
  Mov    Num2,Dx
  Mov    Si,1
  Push   Dx
  Mov    Dl,StrLen
  Xor    Dh,Dh
  Cmp    Dx,Si
  Pop    Dx
  Jbe    Short Exit
 Lp3:
;  Push   0125h
  Lea    Bx,TName
  Mov    Al,Byte Ptr [Bx+Si]
  Cbw
  Add    Bx,Si
  Mov    Cx,Ax
  Mov    Al,Byte Ptr [Bx-1]
  Cbw
  Add    Ax,0Bh
  IMul   Cx
  Push   Dx Ax
  Pop    EAx
  Mov    ECx,125h
  IMul   ECx
  Add    DWord Ptr [Num1],EAx
  Inc    Si
  Push   Dx
  Xor    Dx,Dx
  Mov    Dl,StrLen
  Cmp    Dx,Si
  Pop    Dx
  Ja     Short Lp3
 Exit:
  Ret
EndP

  Intro  Db 13,10
         Db 'DeckWorks v2.1 *KeyGen* c0ded bY Dark Stalker / UCF (01/13/97)'
         Db 13,10,13,10
         Db '  Enter your name : $'
  TheKey Db '  Your key is     : $'
  Empty  Db 13,10
         Db 'Entering a name would *really* help :)'
  CrLf   Db 13,10,'$'
  Num1   Dw 0
  Num2   Dw 0
 KbdIn   Equ $
  MaxLen Db 7Fh
  StrLen Db ?
  TName  Db 7Fh Dup (?)
Code ends

End start
