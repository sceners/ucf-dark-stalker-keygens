Code     Segment Byte Public
Assume   Cs:Code,Ds:Code
Org      100h
P386

 Start:
  Call   SendCrLf
  Mov    Dx,OffSet Intro
  Call   Print
  Call   SendCrLf
  Mov    Dx,OffSet ReadSt
  Call   Print            ; Display message "Enter your name..."
  Lea    Dx,KbdIn         ; Load address of the KeyBoard info.
  Mov    Ah,0Ah           ; DOS function to read string 
  Int    21h              ; Read the string
  Call   SendCrLf
  Cmp    StrLen,0         ; Check to see if string is empty
  Ja     GotStr           ; Yes, jump to NoStr
  Mov    Dx,OffSet Empty
  Jmp    Quit
 GotStr:
  Call   MakeKey          ; Create the key
  Mov    Dx,OffSet TheKey
 Quit:
  Call   Print
  Call   SendCrLf         ; Restore Dx that is holding CrLf address
  Ret

SendCrLf Proc
  Mov    Al,13d
  Int    29h
  Mov    Al,10d
  Int    29h
  Ret
SendCrLf EndP

Print Proc
  Mov    Ah,9             ; DOS function to display string
  Int    21h              ; Display the string at DS:DX
  Ret                     ; Return
Print EndP

MakeKey Proc
  Mov    Cl,StrLen
  Mov    Di,OffSet RegTo
  Push   Di Di
  Add    Di,Cx
  Mov    Al,0
  StoSb
  Pop    Si
 Loc:
  Mov    Di,OffSet Key
  Inc    Bx
  Mov    Cl,5
 Lp:
  LodSw
  Xor    Ax,[Di]
  Ror    Ax,4
  StoSw
  Loop   Lp
  Cmp    Bx,6
  Jb     Loc
  Mov    Ah,3Ch
  Mov    Dx,OffSet KeyFn
  Int    21h
  XChg   Ax,Bx
  Mov    Ah,40h
  Pop    Dx
  Mov    Cl,70d
  Int    21h
  Mov    Ah,3Eh
  Int    21h
  Ret
MakeKey EndP

  Intro  Db 'AEP v1.00 KeYGen bY Dark Stalker / UCF (12/29/96)',13,10,'$'
  Empty  Db 'I think you should try entering a name.$'
  ReadSt Db ' Enter your name : $'
  TheKey Db ' Key file created.$'
  KeyFn  Db 'KJH.KEY',0
  KbdIn  Label Byte
  ChMax  Db 60d
  StrLen Db 0
  RegTo  Db 60d Dup (0)
  Key    Db 'Ke Jia-Han'
Code Ends

End Start