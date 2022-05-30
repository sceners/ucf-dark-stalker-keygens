{$M 45555,0,655055}
Program WebPenKeyGen;

Uses Tui,
     Crt,
     Basic,
     Music;

Var
  Num1           :  LongInt;
  Num2           :  LongInt;
  Junk           :  Integer;

Function Right(S:String;Num:Byte) : String; Assembler;
Asm
  Push   Ds
  Les    Di,@Result
  Lds    Si,S
  Mov    Al,Num
  Cld
  Xor    Cx,Cx
  Mov    Cl,Byte Ptr [Si]
  Inc    Si
  Cmp    Cx,0
  Jz     @@2
  Cmp    Al,0
  Jbe    @@1
  Mov    Byte Ptr Es:[Di],Al
  Inc    Di
  Sub    Cl,Al
  Add    Si,Cx
  Mov    Cl,Al
  Rep    MovSb
  Jmp    @@3
 @@1:
  Mov    Cl,0
 @@2:
  Mov    Byte Ptr Es:[Di],Cl
 @@3:
  Pop    Ds
End;

Function MyReadLn(Ch:Char;Len:LongInt) : String;
Var
  PassCh         :  Char;
  TempPassWord   :  String;
  DontRead       :  Boolean;
  D              :  LongInt;
  OldX           :  Byte;
  OldY           :  Byte;
Begin
  TextColor(11);
  TempPassWord:='';
  OldX:=WhereX;
  OldY:=WhereY;
  DontRead:=False;
  For D:=1 To Len Do
    Write(Ch);
  GotoXy(OldX,OldY);
  Repeat
    PassCh:=ReadKey;
    If (PassCh = #8) And (Length(TempPassWord) > 0) Then
      Begin
        Delete(TempPassWord,Length(TempPassWord),1);
        GotoXy(WhereX-1,WhereY);
        Write(Ch);
        GotoXy(WhereX-1,WhereY);
      End;
    If (Length(TempPassWord)+1 > Len) And (PassCh <> #13) Then
      Begin
        DontRead:=True;
        Write(#7);
      End;
    If (PassCh >= #32) And (PassCh <= #255) And (DontRead <> True) Then
      Begin
        TempPassWord:=TempPassWord+PassCh;
        Write(PassCh);
      End;
    DontRead:=False;
  Until (PassCh = #13);
  If Length(TempPassWord) = 0 Then
    WriteLn('[Rand0m]')
  Else
    WriteLn;
  MyReadLn:=TempPassWord;
End;

Function DoReader(S:String) : String;
Var
  Tmp            :  String;
Begin
  TextColor(9);
  Write(S);
  Tmp:=MyReadLn(' ',4);
  If (Length(Tmp) <> 4) And (Length(Tmp) <> 0) Then
    Begin
      RandSeed:=MaxLongInt;
      Randomize;
      Str(Random(8888)+1000,Tmp);
    End
  Else
    Begin
      RandSeed:=MaxLongInt;
      Randomize;
      Str(Random(8888)+1000,Tmp);
    End;
  DoReader:=Tmp;
End;

Function MakeKey(Num1,Num2:LongInt) : String;
Var
  Tmp            :  LongInt;
  TmpStr         :  String;
  KeyStr         :  String;
Begin
  Tmp:=(Num1*Num2)+Num1+Num2+1941;
  Str(Tmp,TmpStr);
  KeyStr:=Right(TmpStr,4);
  Str(Num1,TmpStr);
  TmpStr:=TmpStr+KeyStr;
  Str(Num2,KeyStr);
  TmpStr:=TmpStr+KeyStr;
  MakeKey:=TmpStr; 
End;

Begin
  SetVolume(13);
  PlaySong;
  ClrScr;
  HideCursor;
  WinD(5,15,16,73,8,0);
  GotoXy(18,7);
  TextColor(9);
  Write(' Web Pen/Parse KeyGen bY Dark Stalker / UCF (10/20/96)');
  GotoXy(18,WhereY+2);
  Write('Pick 2 #''s that MUST be at least 4 digits #''s');
  GotoXy(18,WhereY+1);
  Write('  Just hit enter for a random number');
  GotoXy(18,WhereY+2);
  Val(DoReader(' Number 1: '),Num1,Junk);
  GotoXy(18,WhereY);
  Val(DoReader(' Number 2: '),Num2,Junk);
  GotoXy(28,WhereY+1);
  TextColor(9);
  Write('Your key is: ');
  TextColor(11);
  WriteLn(MakeKey(Num1,Num2));
  ShowCursor;
  EndSong;
End.
