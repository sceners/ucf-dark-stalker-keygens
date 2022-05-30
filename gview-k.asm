.Model   Small
.Code
Org      100h

 Start:
  Mov    Dx,OffSet CrLf
  Call   Print

  Push   Dx
  Mov    Dx,OffSet Intro
  Call   Print            ; Display message "Graphics viewer keygen"
  Pop    Dx
  Call   Print

  Push   Dx
  Mov    Dx,OffSet ReadSt
  Call   Print            ; Display message "Enter your name..."
  Lea    Dx,KbdIn         ; Load address of the KeyBoard info.
  Mov    Ah,0Ah           ; DOS function to read string 
  Int    21h              ; Read the string
  Pop    Dx
  Call   Print

  Push   Dx
  Cmp    StrLen,0         ; Check to see if string is empty
  Jbe    NoStr            ; Yes, jump to NoStr
  Mov    Dx,OffSet TheKey
  Call   Print            ; Display message "Your key is..."
  Call   MakeKey          ; Create the key
  Pop    Dx
  Call   Print            ; Display CrLf

  Ret                     ; Quit the program

Print Proc
  Mov    Ah,9             ; DOS function to display string
  Int    21h              ; Display the string at DS:DX
  Ret                     ; Return
Print EndP

MakeKey Proc
 Next:
  In     Ax,40h
  Cmp    Ax,100d
  Jb     Short Next
  Xor    Dx,Dx
  Call   DispDec
  Ret
MakeKey EndP

NoStr Proc
  Pop    Dx               ; Restore Dx that is holding CrLf address
  Call   Print            ; Displays message CrLf
  Push   Dx
  Mov    Dx,OffSet Empty
  Call   Print            ; Displays message "I think you should..."
  Pop    Dx
  Call   Print            ; Displays message CrLf
  Int    20h              ; Quit the program
NoStr EndP

DispDec Proc Near
  Mov    Di,OffSet Buf+3
  Mov    Bx,10d
  Mov    Cx,3
 Lp1:
  Div    Bx
  Add    Dl,30h
  Dec    Di
  Mov    [Di],Dl
  Cmp    Ax,0
  Je     Exit
  Xor    Dx,Dx
  Loop   Lp1
 Exit:
  Mov    Dx,Di
  Call   Print
  Ret
  Buf    Db 3 Dup(0),'$'
DispDec EndP

  Intro  Db 'Graphics Viewer v1.35 KeYGeN bY Dark Stalker / UCF (12/06/98)'
  CrLf   Db 13,10,'$'
  Empty  Db 'I think you should try entering a name.$'
  ReadSt Db ' Enter your name : $'
  TheKey Db ' Your key is     : 16$'
  KbdIn  Label Byte
  ChMax  Db 59d
  StrLen Db 0
  RegTo  Db 50 Dup (?)
  Key    Dw ?
End Start

