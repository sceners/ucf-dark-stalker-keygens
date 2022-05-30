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
  Mov    Ax,6521h
  Mov    Cl,StrLen
  Xor    Ch,Ch
  Lea    Dx,TName
  Int    21h
  XChg   Bx,Dx
  Mov    Cl,StrLen
  Xor    Ch,Ch
  JCxZ   Short NoStr
  Add    Bx,Cx
  Mov    Di,Bx
  Mov    Al,20h
  StoSb
  Lea    Si,TName
  Mov    Cx,19h
  Mov    Ah,11h
 Lp1:
  LodSb
  Add    TheKey,Ax
  Loop   Lp1
  Lea    Dx,YoKey
  Call   Print
  Mov    Ax,TheKey
  Xor    Dx,Dx
  Call   PrintNum
  Lea    Dx,Done
  Mov    Al,0
 Quit:
  Call   Print
  Mov    Ah,4Ch
  Int    21h
 NoStr:
  Lea    Dx,Empty
  Mov    Al,1
  Jmp    Short Quit

Print Proc
  Push   Ax
  Mov    Ah,9
  Int    21h
  Pop    Ax
  Ret
EndP

PrintNum Proc Near
  Mov    Di,OffSet Buf+6
  Mov    Bx,10d
  Mov    Cx,6
 Lp2:
  Div    Bx
  Add    Dl,30h
  Dec    Di
  Mov    [Di],Dl
  Cmp    Ax,0
  Je     Exit
  Xor    Dx,Dx
  Loop   Lp2
 Exit:
  Mov    Dx,Di
  Call   Print
  Ret
  Buf    Db 6 Dup (0),'$'
EndP

  Intro  Db 13,10
         Db 'TRON! v1.06   *kEYmAKER*  bY  Dark Stalker / UCF (03/01/97)',13,10
         Db 13,10
         Db ' Enter your name: $'
  YoKey  Db ' Your key is    : ST+$'
  Empty  Db 13,10,'Entering a name would help ;)',13,10,'$'
  Done   Db 13,10,13,10
         Db 'Done! Have a nice day ;)'
  CrLf   Db 13,10,'$'
  TheKey Dw 0
 KbdIn   Equ $
  MaxLen Db 19h
  StrLen Db 00h
  TName  Db 1Ah Dup (20h)
Code Ends

End Start
