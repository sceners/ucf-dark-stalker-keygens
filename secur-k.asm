Code     Segment Byte Public
Assume   Cs:Code,Ds:Code
Org      100h
P286

 Start:
  Mov    Dx,OffSet Intro
  Call   Print
  Mov    Ah,0Ah
  Lea    Dx,KbdIn
  Int    21h
  Cmp    InBuf,0Ah
  Ja     GotChr
  Mov    Dx,OffSet NoStr
  Jmp    Quit
 GotChr:
  Call   GetLen

;*************

 IncIt:
  Inc    LpNum
  Mov    Ax,LpNum
  Xor    Dx,Dx
  Mov    Cx,8
  Div    Cx
  Call   IncLp
  Mov    Cx,Dx
  Shl    Ax,Cl
  Mov    Dx,Ax
  Call   PutByte
  Call   StoreKey
  Jne    Short IncIt
  Mov    Ax,XorKey
  Not    Ax
  Mov    Key1,Ax
  Mov    XorKey,0AADh
  Call   GetLen
  Mov    LpNum,0
 IncIt2:
  Inc    LpNum
  Call   PutByte
  Shl    Ax,8
  Mov    Dx,Ax
  Call   IncLp
  Call   StoreKey
  Jne    Short IncIt2
  Mov    Ax,XorKey
  Mov    Key2,Ax
  Mov    XorKey,0FF41h
  Mov    LpNum,0
  Call   GetLen
 IncIt3:
  Inc    LpNum
  Mov    Ax,LpNum
  Xor    Dx,Dx
  Mov    Cx,8
  Div    Cx
  Mov    Ax,LpNum
  Inc    Ax
  Mov    Di,Ax
  Mov    Al,InBuf[Di]
  Xor    Ah,Ah
  Mov    Cx,Dx
  Shl    Ax,Cl
  Mov    Dx,Ax
  Mov    Di,LpNum
  Mov    Al,InBuf[Di]
  Xor    Ah,Ah
  Add    Ax,Dx
  Xor    Ax,XorKey
  Mov    XorKey,Ax
  Mov    Ax,LpNum
  Cmp    Ax,StrLen
  Jne    Short IncIt3
  Mov    Ax,XorKey
  Not    Ax
  Mov    Key3,Ax

  Mov    Ah,3Ch
  Mov    Dx,OffSet KeyFn
  Xor    Cx,Cx
  Int    21h
  Jnc    Open
  Mov    Dx,OffSet FnErr
  Jmp    Short Quit
 Open:
  XChg   Ax,Bx
  Xor    Cx,Cx
  Mov    Cl,InBuf
  Inc    Cl
  Lea    Dx,InBuf
  Mov    Ah,40h
  Int    21h
  Lea    Dx,Key1
  Mov    Cl,6
  Mov    Ah,40h
  Int    21h
  Mov    Ah,3Eh
  Int    21h
  Lea    Dx,MakeIt

Print Proc
 Quit:
  Mov    Ah,9
  Int    21h
  Ret
Print EndP

PutByte Proc
  Mov    Ax,LpNum
  Inc    Ax
  Mov    Di,Ax
  Mov    Al,InBuf[Di]
  Xor    Ah,Ah
  Ret
PutByte EndP

StoreKey Proc
  Add    Ax,Dx
  Xor    Ax,XorKey
  Mov    XorKey,Ax
  Mov    Ax,LpNum
  Cmp    Ax,StrLen
  Ret
StoreKey EndP

IncLp Proc
  Mov    Di,LpNum
  Mov    Al,InBuf[Di]
  Xor    Ah,Ah
  Ret
IncLp EndP

GetLen Proc
  Xor    Ax,Ax
  Mov    Al,InBuf
  Dec    Ax
  Mov    StrLen,Ax
  Ret
GetLen EndP

  Intro  Db 13,10
         Db 'Secure v0.21 Keygenerator c0ded bY Dark Stalker / UCF (03/08/97)',13,10
         Db 13,10
         Db 'Enter your Name please : $'
  NoStr  Db 10,13,10,'Name must be longer! (10 char or longer)',13,10,10,'$'
  FnErr  Db 'Error making keyfile!',13,10,'$'
  MakeIt Db 13,10
         Db '   Creating '
  KeyFn  Db 'SECURE.REG',0
         Db ': '
  Done   Db 'Done!',13,10,13,10,'Have a nice day! ;)',13,10,'$'
  LpNum  Dw 0
  XorKey Dw 316Fh
 KbdIn Label Byte
  MaxCh  Db 7Fh
  InBuf  Db 127 Dup (?)
  StrLen Dw ?
  Key1   Dw ?
  Key2   Dw ?
  Key3   Dw ?
Code Ends

End Start
