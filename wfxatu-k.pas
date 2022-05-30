{$M 45555,0,655055}
Program WinFaxAutoKeyGen;

Uses Tui,
     Crt,
     Basic,
     Music;

Var
  Name           :  String;

Function MakeKey(Name:String) : String;
Var
  X              :  Byte;
  Code           :  String;
  Tmp            :  Integer;
  Key            :  Integer;
  TmpStr         :  String;
Begin
  Code[0]:=#0;
  Name:=UpStr(Name);
  If Length(Name) < 8 Then
    For X:=1 To (8-Length(Name)) Do
      Name:=Name+Chr(X);
  For X:=1 To 7 Do
    Begin
      Tmp:=Abs(Ord(Name[X])-Ord(Name[X+1]));
      If Tmp < 10 Then
        Key:=Tmp
      Else
        Key:=Tmp Mod 10;
      Str(Key,TmpStr);
      Code:=Code+TmpStr;
    End;
  MakeKey:=Code;
End;

Begin
  SetVolume(9);
  PlaySong;
  ClrScr;
  HideCursor;
  WinD(7,15,14,73,8,0);
  GotoXy(19,9);
  TextColor(9);
  Write('WinFax Auto KeyGen bY Dark Stalker / UCF (??/??/97)');
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
      WriteLn(MakeKey(Name));
    End
  Else
    WriteLn('Are you asking me to delete myself?');
  ShowCursor;
  EndSong;
End.
