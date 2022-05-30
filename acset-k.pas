{$M 45555,0,655055}
Program AccusetKeyGen;

Uses Tui,
     Crt,
     Basic,
     Music;

Var
  Name           :  String;

Function RepIt(X:Byte) : String; Assembler;
Asm
  Les    Di,@Result
  Mov    Al,X
  StoSb
  Xor    Cx,Cx
  Mov    Cl,X
  Mov    Ax,'  '
  Rep    StoSw
  Jnc    @Exit
  StoSb
 @Exit:
End;

Function MakeKey(Name:String;Num:Integer) : String;
Var
  Done           :  Boolean;
  Count          :  Integer;
  Len            :  Integer;
  Code           :  String;
Begin
  Code[0]:=#0;
  Done:=False;
  Count:=1;
  Len:=Length(Name);
  If Len < 5 Then
    Name:=Name+RepIt(5-Len);
  While (Done <> True) Do
    Begin
      Code:=Code+Right(Int2Str(Ord(Name[Count])*(Num+2)*Count),1);
      Inc(Count);
      If Count > 5 Then
        Done:=True;
    End;
  MakeKey:=Code;
End;

Begin
  SetVolume(13);
  PlaySong;
  ClrScr;
  HideCursor;
  WinD(7,15,14,73,8,0);
  GotoXy(19,9);
  TextColor(9);
  Write('Accuset v3.0a KeyGen bY Dark Stalker / UCF (01/18/97)');
  GotoXy(19,WhereY+2);
  Write('Enter your name: ');
  TextColor(11);
  ReadLn(Name);
  TextColor(9);
  GotoXy(19,WhereY);
  If Name <> '' Then
    Begin
      Write('Your key is    : ');
      TextColor(11);
      WriteLn(MakeKey(Name,2));
    End
  Else
    WriteLn('I need a name to make the key!');
  ShowCursor;
  EndSong;
End.
