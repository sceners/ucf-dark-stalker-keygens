.Model   Small
.Code
Org      100h

 Start:

  Jmp    RealSt           ; Jump to the real code

; Data values for keygen
  Intro  Db 'WinGage v2.1 KeyGen bY Dark Stalker / UCF (10/20/96)'
  CrLf   Db 13,10,'$'
  Empty  Db 'I think you should try entering a name.$'
  ReadSt Db ' Enter your name : $'
  TheKey Db ' Your key is     : $'
  Key    Dw 0
  KbdIn  Label Byte
  ChMax  Db 59d
  StrLen Db 0
  RegTo  Db 50 Dup (0)

 RealSt:
  Mov    Dx,OffSet CrLf
  Call   Print

  Push   Dx
  Mov    Dx,OffSet Intro
  Call   Print            ; Display message "Time & Chaos KeyGen..."
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
  Call   MakeKey          ; Create the key
  Mov    Dx,OffSet TheKey
  Call   Print            ; Display message "Your key is..."
  Xor    Dx,Dx            ; Zero upper register (DX:AX)
  Mov    Ax,Key           ; Ax will hold key since key is a Word value
  Call   DispDec          ; Display the key (Thx Misha for DispDec :)
  Pop    Dx
  Call   Print            ; Display CrLf

  Ret                     ; Quit the program

Print Proc
  Mov    Ah,9             ; DOS function to display string
  Int    21h              ; Display the string at DS:DX
  Ret                     ; Return
Print EndP

MakeKey Proc
  Xor    Ax,Ax
  Xor    Dx,Dx
  Mov    Dl,StrLen
  Mov    Cx,141d
 @Lp:
  Add    Ax,Dx
  Loop   @Lp
  Add    Ax,2000d
  Mov    Key,Ax
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
  Mov    Di,OffSet Buf+6
  Mov    Bx,10d
  Mov    Cx,6
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
  Buf    Db 6 Dup(0),'$'
DispDec EndP

End Start
