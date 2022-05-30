Unit Basic;

Interface

Function Trim(S:String) : String;
Function Str2Int(St:String) : LongInt;
Function Int2Str(Int:LongInt) : String;
Function UpStr(S:String) : String;
Function LCase(Const S:String) : String;
Function LTrim(S:String) : String;
Function RTrim(S:String) : String;
Function Mid(StrName:String;StartPos,NumChars:Integer) : String;
Function Left(StrName:String;NumChars:Integer) : String;
Function Right(StrName:String;NumChars:Integer) : String;
Procedure HideCursor;
Procedure ShowCursor;

Implementation

Function Int2Str;
Var
  Tmp            :  String;
Begin
  Str(Int,Tmp);
  Int2Str:=Tmp;
End;

Function Str2Int;
Var
  Tmp            :  LongInt;
  Tmp2           :  Integer;
Begin
  Val(St,Tmp,Tmp2);
  Str2Int:=Tmp;
End;

Function Mid;
Begin
  Mid:=Copy(StrName,StartPos,NumChars);
End;

Function Left;
Begin
  Left:=Copy(StrName,1,NumChars);
End;

Function Right;
Begin
  Right:=Copy(StrName,(Length(StrName)-(NumChars-1)),NumChars);
End;

Procedure Trm(Var Str:String); Assembler;
Asm
  Les    Di,Str
  Lds    Si,Str
  Xor    Cx,Cx
  Mov    Cl,[Di]
  JCxZ   @Exit
  Mov    Bx,Di
  Xor    Dx,Dx
  Mov    Al,' '
  Std
  Add    Di,Cx
  Repe   ScaSb
  Jz     @Done
  Inc    Cx
  Cld
  Inc    Si
  Mov    Di,Si
  Repe   ScaSb
  Jz     @Done
  Inc    Cx
  Dec    Di
  Mov    Dx,Cx
  XChg   Di,Si
  Rep    MovSb
 @Done:
  Mov    [Bx],Dl
 @Exit:
End;

Function Trim;
Var
  Tmp            :  String;
Begin
  Tmp:=S;
  Trm(Tmp);
  Trim:=Tmp;
End;

Function LTrim; Assembler;
Asm
  Push   Ds
  Lds    Si,S
  Xor    Ax,Ax
  LodSb
  XChg   Ax,Cx
  Les    Di,@Result
  Inc    Di
  JCxZ   @Lp2
  Cld
 @Lp1:
  LodSb
  Cmp    Al,' '
  Loope  @Lp1
  Dec    Si
  Inc    Cx
  Rep    MovSb
 @Lp2:
  XChg   Ax,Di
  Mov    Di,Word Ptr @Result
  Sub    Ax,Di
  Dec    Ax
  StoSb
  Pop    Ds
End;

Function RTrim;
Begin
  While (Length(S) > 0) And (S[Length(S)] = ' ') Do
    Dec(S[0]);
  RTrim:=S;
End;

Function UpStr; Assembler;
Asm
  Push   Ds
  Cld
  Lds    Si,S
  Xor    Ax,Ax
  LodSb
  XChg   Ax,Cx
  Les    Di,@Result
  Mov    Byte Ptr Es:[Di],Cl
  JcXz   @3
  Inc    Di
  @1:
  LodSb
  Cmp    Al,'a'
  Jb     @2
  Cmp    Al,'z'
  Ja     @2
  Xor    Al,$20
  @2:
  StoSb
  Loop   @1
  @3:
  Pop    Ds
End;

Function LCase(Const S:String) : String; Assembler;
Asm
  Push   Ds
  LDs    Si,S
  LEs    Di,@Result
  MovSb
  Xor    Ch,Ch
  Mov    Cl,Al
  JCxZ   @Exit
 @Lp:
  LodSb
  Cmp    Al,'A'
  Jb     @Cont
  Cmp    Al,'Z'
  Ja     @Cont
  Add    Al,' '
 @Cont:
  StoSb
  Loop   @Lp
 @Exit:
  Pop    Ds
End;

Procedure HideCursor; Assembler;
Asm
  Mov    Ax,100h
  Mov    Cx,2607h
  Int    10h
End;

Procedure ShowCursor; Assembler;
Asm
  Mov    Ax,100h
  Mov    Cx,506h
  Int    10h
End;

End.