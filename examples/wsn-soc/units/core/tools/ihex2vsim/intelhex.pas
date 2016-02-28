(***************************************************************************
 *   Copyright (C) 2012 by Johann Glaser <Johann.Glaser@gmx.at>            *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             *
 ***************************************************************************)

{$MODE OBJFPC}
Unit IntelHex;

Interface

{ maximum bytes per line in a intel hex file }
Const MaxIntelHexRecordLength = 16;

{ transportation record for ihx data }
Type PIntelHexRecord = ^TIntelHexRecord;
     TIntelHexRecord = record
       Next    : PIntelHexRecord;
       Length  : Byte;
       Address : Word;
       TheType : Byte;
       Data    : Array[0..MaxIntelHexRecordLength-1] of Byte;
     End;

{ read in an ihx file }
Function  ReadHexFile(Filename:ShortString):PIntelHexRecord;
{ free an ihx record chain }
Procedure FreeIntelHex(Var Rec:PIntelHexRecord);

Implementation
Uses SysUtils;

Const HexChars = '0123456789ABCDEF';

Function HexToInt(St:ShortString):Int64;
Var I,J : LongInt;
Begin
  Result := 0;
  For I := 1 to Length(St) do
    Begin
      J := Pos(UpCase(St[I]),HexChars);
      if J = 0 then
        raise EConvertError.CreateFmt('Wrong hex char "%s" in hex number "%s" at position %d.',[St[I],St,I]);
      Result := Result shl 4 or (J-1);
    End;
End;

{ reserves the memory for an ihx record and prepares it }
Function GetIntelHexRecord : PIntelHexRecord;
Begin
  New(Result);
  FillChar(Result^,Sizeof(Result^),0);
End;

{ parse one line form an ihx file. returns a ihx record }
{ 12345678901234567...          }
{ :llaaaattddddddddddddddddddcc }
{ ll ....... length             }
{ aaaa ..... address            }
{ tt ....... type               }
{ dd... .... data               }
{ cc ....... checksum           }
Function ParseHexLine(St:ShortString):PIntelHexRecord;
Var Checksum : LongInt;
    I        : LongInt;
Begin
  if St[1] <> ':' then
    raise EConvertError.CreateFmt('Error in Intel HEX File: Line doesn''t start with a '':''! ("%s")',[St]);
  Result := GetIntelHexRecord;
  With Result^ do
    Begin
      Length  := HexToInt(Copy(St,2,2));
      Address := HexToInt(Copy(St,4,4));
      TheType := HexToInt(Copy(St,8,2));
      if Length > MaxIntelHexRecordLength then
        raise EConvertError.CreateFmt('Error in Intel HEX File: Line contains more that %d bytes! (%d)',[MaxIntelHexRecordLength,Length]);
    
      Checksum := LongInt(Length)+(LongInt(Address) shr 8)+(LongInt(Address) and $FF)+LongInt(TheType);
      For I := 0 to Length-1 do
        Begin
          Data[I] := HexToInt(Copy(St,I*2+10,2));
          Checksum := Checksum + Data[I];
        End;
      Checksum := (- Checksum) and $FF;
      if Checksum <> HexToInt(Copy(St,10+Length*2,2)) then
        raise EConvertError.CreateFmt('Error in Intel HEX File: Checksum %x is wrong! ("%s")',[Checksum,St]);
    End;
End;

Function ReadHexFile(Filename:ShortString):PIntelHexRecord;
Var HexFile  : Text;
    St       : ShortString;
    Rec      : PIntelHexRecord;
Begin
  Result := Nil;
  Assign(HexFile,Filename);
  {$I-} Reset(HexFile); {$I+}
  if IOResult <> 0 then Exit;
  try
    While not EOF(HexFile) do
      Begin
        ReadLn(HexFile,St);
        if Result = Nil then
          Begin
            Result := ParseHexLine(St);
            Rec := Result;
          End
        else
          Begin
            Rec^.Next := ParseHexLine(St);
            Rec := Rec^.Next;
          End;
      End;
  finally
    Close(HexFile);
  End;
End;

Procedure FreeIntelHex(Var Rec:PIntelHexRecord);
Var R : PIntelHexRecord;
Begin
  While Rec <> Nil do
    Begin
      R   := Rec;
      Rec := Rec^.Next;
      Dispose(R);
    End;
End;

End.

