.Model   Small
.Code
Org      100h
P386

Start:
  Lea    Dx,Intro
  Call   Print
 Try_Ag:
  Xor    Ah,Ah
  Int    16h
  XChg   Al,Dl
  Mov    Ax,6520h      ; uppercase the character
  Int    21h
  Cmp    Al,'S'
  Je     Short UserIn
  Cmp    Al,'R'
  Je     UseRand
  Cmp    Al,'Q'
  Je     Short Exit
  Mov    Ah,3
  Xor    Bx,Bx
  Int    10h
  Push   Dx
  Mov    Al,7
  Int    29h
  Pop    Dx
  Mov    Ah,2
  Int    10h
  Jmp    Short Try_Ag
 CdDone:
  Lea    Dx,OutCd
  Call   Print
  Lea    Dx,Key
  Call   Print
  Lea    Dx,Done
  Call   Print
  Jmp    Short Quit
 Exit:
  Call   WriteCh
  Lea    Dx,Done
  Call   Print
 Quit:
  Mov    Ax,4C00h
  Int    21h
 UserIn:
  Call   WriteCh
  Lea    Dx,OutCd
  Call   Print
  Lea    Di,Key
  Mov    Ah,3
  Int    10h
  PushA
  Lea    Dx,Key
  Call   Print
  PopA
  Dec    Dh
  Mov    Ah,2
  Int    10h
  Call   GetChar
  StoSb
  Mov    Al,[Di]
  Int    29h
  Inc    Di
  Mov    Al,[Di]
  Int    29h
  Inc    Di
  Add    Dx,3
  Mov    Cx,4
 Lp2:
  Mov    Ah,2
  Int    10h
  Call   GetChar
  StoSb
  Inc    Dx
  Loop   Lp2
  Mov    Al,[Di]
  Int    29h
  Inc    Di
  Call   GetChar
  StoSb
  Inc    Dx
  Mov    Ah,2
  Int    10h
  Lea    Dx,CrLf
  Call   Print
  Jmp    Short Quit
 UseRand:
  Call   WriteCh
  Call   MakeKey
  Jmp    CdDone

WriteCh Proc
  XChg   Al,Dl
  Int    29h
  Lea    Dx,CrLf
  Call   Print
  Ret
EndP

GetChar Proc
 Try_2:
  Xor    Ah,Ah
  Int    16h
  Cmp    Al,'0'
  Jb     Short Try_2
  Cmp    Al,'9'
  Ja     Short Try_2
  Int    29h
  Ret
EndP

MakeKey Proc
  Lea    Di,Key
  Call   MakeNumber
  StoSb
  Inc    Di
  Inc    Di
  Mov    Cx,4
 LpX:
  Call   MakeNumber
  StoSb
  Loop   LpX
  Inc    Di
  Call   MakeNumber
  StoSb
  Ret
EndP

MakeNumber Proc
  Push   Bx Cx Dx
  In     Ax,40h
  Mov    Bx,Ax
  Mov    Ax,2A00h
  Int    21h
  Add    Bx,Dx
  Add    Bx,Cx
  Mov    Ax,2C00h
  Int    21h
  Add    Bx,Dx
  Add    Bx,Cx
  XChg   Ax,Bx
  Pop    Dx Cx Bx
  Xor    EBx,EBx
  Mov    Bl,10
  Xor    EDx,EDx
  Div    EBx
  Add    Dl,'0'
  XChg   Al,Dl
  Ret
EndP

Print Proc
  Mov    Ah,9
  Int    21h
  Ret
EndP

  Intro  Db 13,10
         Db 'Garbage Can (01/97)  *KeYGeN*  bY Dark Stalker / UCF (01/18/97)',13,10
         Db 13,10
         Db ' (S)elect your key numbers',13,10
         Db ' (R)andom key numbers',13,10
         Db ' (Q)uit the program',13,10
         Db 13,10
         Db 'Please make your choice: $'
  OutCd  Db 13,10
         Db ' Your key is  : $'
  Done   Db 13,10
         Db ' Thank you for trying this keygen :)',13,10
         Db 13,10
         Db '  NOTE: Use any name with the key that is generated for you.',13,10,'$'
  Key    Db '0410000205'
  CrLf   Db 13,10,'$'
End Start
