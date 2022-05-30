{$M 45555,0,655055}
Program TypeTestKeyGen;

Uses Tui,
     Crt,
     Basic,
     Music;

Var
  Fn             :  String;
  Ln             :  String;

Function MakeKey(FName,LName:String) : LongInt;
Var X,X2:integer;S:String;
Begin
  S:=LCase(FName);
  X:=Ord(S[1]);
  X2:=Ord(LName[1]);
  MakeKey:=((X*5)+(X2*4))*21;
End;

Begin
  SetVolume(13);
  PlaySong;
  ClrScr;
  HideCursor;
  WinD(7,15,15,73,8,0);
  GotoXy(19,9);
  TextColor(9);
  Write('Type Test  KeYGeN bY Dark Stalker / UCF (12/07/96)');
  GotoXy(19,WhereY+2);
  Write('Enter your first name: ');
  TextColor(11);
  ReadLn(Fn);
  TextColor(9);
  GotoXy(19,WhereY);
  Write('Enter your last  name: ');
  TextColor(11);
  ReadLn(Ln);
  TextColor(9);
  GotoXy(19,WhereY);
  If (Fn <> '') And (Ln <> '') Then
    Begin
      Write('Your key is          : ');
      TextColor(11);
      WriteLn(MakeKey(Fn,Ln));
    End
  Else
    WriteLn('I need a name to make the key!');
  ShowCursor;
  EndSong;
End.
