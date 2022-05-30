{$F+}
{$M 22000,0,300000}
Unit Music;

Interface

Procedure PlaySong;
Procedure SetVolume(I:Byte);
Procedure EndSong;

Implementation

Uses Crt,
     AdvHsc;

Type
  BufType        =  Array[1..22000] Of Byte;

Var
  MusicData      :  ^BufType;

{$S-}
Procedure StackOverflow;
Begin
  RunError(202);
End;

{$L UNPACK.OBJ}
Function Unpack(Var InBuffer,OutBuffer;CompressedSize:Word) : Word; External;
{$S+}

{$L MUSIC1.OBJ}
Function CmpMusic1Size : Word; Far; External;
Procedure UnPackCmpMusic1(Var Buffer); Far; External;

Procedure PlaySong;
Begin
  New(MusicData);
  UnPackCmpMusic1(MusicData^);
  PlaySongMemory(@MusicData^);
End;

Procedure EndSong;
Begin
  StopSong;
  ClearMem;
  If MusicData <> Nil Then
    Dispose(MusicData);
End;

Procedure SetVolume;
Begin
  Port[$224]:=4;
  Port[$225]:=(I shl 4 or I);
  Port[$224]:=$22;
  Port[$225]:=(I shl 4 or I);
  Port[$224]:=$26;
  Port[$225]:=(I shl 4 or I);
End;

End.