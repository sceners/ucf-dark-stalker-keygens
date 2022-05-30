{$M 45555,0,655055}
Program NetContactKeyGen;

Uses Tui,
     Crt,
     Basic,
     Music;

Var
  X              :  Integer;
  KeyStr         :  String;
  Key            :  LongInt;
  Code           :  LongInt;

Begin
  SetVolume(12);
  PlaySong;
  ClrScr;
  HideCursor;
  WinD(7,15,14,75,8,0);
  GotoXy(19,9);
  TextColor(9);
  Write('NetContact v5.3 KeYGeN bY Dark Stalker / UCF (??/??/97)');
  GotoXy(19,WhereY+2);
  Write('Enter site code: ');
  TextColor(11);
  ReadLn(KeyStr);
  TextColor(9);
  GotoXy(19,WhereY);
  While Pos('-',KeyStr) <> 0 Do
    Begin
      X:=Pos('-',KeyStr);
      If X <> 0 Then
        Delete(KeyStr,X,1);
    End;
  If KeyStr <> '' Then
    Begin
      Val(KeyStr,Key,X);
      Code:=Trunc(((Key/51)*12)+484848);
      Write('Your code is   : ');
      TextColor(11);
      WriteLn(Code);
    End
  Else
    WriteLn('Enter a sitecode or i''me useless!');
  ShowCursor;
  EndSong;
End.
