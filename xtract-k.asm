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

  Mov    Ah,0Fh
  Int    10h
  XChg   Ah,Al
  Push   Ax
  Mov    Ah,3
  Int    10h
  Xor    Dh,Dh
  Pop    Cx
  Sub    Cx,Dx
  Mov    Ax,0A20h
  Int    10h

  Cmp    StrLen,0
  Jne    Short Next00
  Lea    Dx,NoName
  Call   Print
  Ret
 Next00:
  Lea    Bx,TName
  Adc    Bl,StrLen
  Mov    Word Ptr Cs:[Bx],0A0Dh
  Inc    Bx
  Inc    Bx
  Mov    Byte Ptr Cs:[Bx],24h

  Lea    Si,TName
  Lea    Di,TName2
  Mov    Cx,28h
  Rep    MovSb

  Lea    Dx,One
  Xor    Cx,Cx
 Lp1:
  Inc    One+1
  Call   Print
  Push   Dx
  Mov    Ax,Cx
  Lea    Bx,MsgTab
  Shl    Ax,1
  Add    Bx,Ax
  Mov    Dx,[Bx]
  Call   Print
  Pop    Dx
  Inc    Cx
  Cmp    Cx,4
  Jne    Short Lp1

  Lea    Dx,PickIt
  Call   Print

 TryAg:
  Xor    Ah,Ah
  Int    16h
  Cmp    Al,'1'
  Jb     Short Beep
  Cmp    Al,'4'
  Ja     Short Beep
  Int    29h
  Sub    Al,30h
  Add    Al,0DFh
  Mov    KeyTyp,Al
  Jmp    Short Next
 Beep:
  Mov    Al,7
  Int    29h
  Mov    Ah,2
  Mov    Dl,8
  Int    21h
  Jmp    Short TryAg
 Next:
  Lea    Dx,CrLf
  Call   Print

  Call   Create_Crc

  Call   Crypt_Text

  Mov    Ah,3Ch
  Lea    Dx,FName
  Xor    Cx,Cx
  Int    21h
  Jnc    Short Ok
  Lea    Dx,FcErr
  Jmp    Short Quit
 Ok:
  XChg   Ax,Bx
  Mov    Ah,40h
  Lea    Dx,Begin
  Mov    Cx,(Finish-Begin)
  Int    21h
  Mov    Ah,3Eh
  Int    21h

  Lea    Dx,Done
 Quit:
  Call   Print
  Mov    Ah,4Ch
  Int    21h

Crypt_Text Proc
  Lea    Si,TName2
  Mov    Di,Si
  Mov    Cx,2Ah
  Mov    Bl,KeyTyp
 Lp2:
  LodSb
  Xor    Al,Bl
  StoSb
  Sub    Bl,22h
  Loop   Lp2
  Ret
EndP

Create_Crc Proc
  Lea    Si,TName2
  Mov    Di,Si
  Mov    Cx,28h
  Mov    Bl,KeyTyp
  Xor    Dx,Dx
  Xor    Ax,Ax
 Lp3:
  LodSb
  Add    Dx,Ax
  Loop   Lp3
  Mov    Crc,Dx
  Ret
EndP

Print Proc
  Mov    Ah,9
  Int    21h
  Ret
EndP

  Intro  Db 13,10
         Db 'X-Tract v1.51  *KeyMaker* bY  Dark Stalker / UCF (03/14/97)',13,10
         Db 13,10
         Db ' Enter your name: $'
  One    Db ' 0'
   Msg   Db '. $'
 MsgTab  Equ $
   Dw    OffSet RegVer
   Dw    OffSet BetVer
   Dw    OffSet DisVer
   Dw    OffSet SpeVer
  PickIt Db 13,10
         Db 'Please pick one of the key types above (1 - 4): $'
  FcErr  Db 'Error creating key file!',13,10,'$'
  NoName Db 'Try entering a name next time, lamer :)',13,10,'$'
  Done   Db 13,10
         Db 'Done! '
  FName  Db 'X-TRACT.KEY',0
         Db 'created in current directory!',13,10,'$'
  RegVer Db ' REGISTERED VERSION'
  CrLf   Db 13,10,'$'
  BetVer Db ' BETA-TEST VERSION',13,10,'$'
  DisVer Db ' DISTR. SITE VERSION',13,10,'$'
  SpeVer Db ' SPECIAL VERSION',13,10,'$'
 KbdIn   Equ $
  MaxLen Db 25h
  StrLen Db 0
  TName  Db 28h Dup (0)
Begin Equ $
  KeyMsg Db 'This is your registration key for X-TRACT. Please, do not distribute it!',13,10
         Db '(c) 1994 by Woody, Buenos Aires, ARGENTINA. Pablo Lives Somewhere In The Time.',13,10
  KeyTyp Db ?
  TName2 Db 28h Dup (?)
  Crc    Dw ?
Finish Equ $
Code Ends

End Start
