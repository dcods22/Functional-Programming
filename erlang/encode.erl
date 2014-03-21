-module(encode).
-export([addInt/2,subInt/2,encode/2,decode/2]).

addInt(CharInt,MoveAmt) ->
    if
      CharInt < 64 ->
        CharInt;
      (CharInt + MoveAmt) > 90 ->
        (64 + ((CharInt + MoveAmt) - 90));
      true ->
        (CharInt + MoveAmt) 
    end.

subInt(CharInt,MoveAmt) ->    
    if
      CharInt < 64 ->
        CharInt;
      (CharInt - MoveAmt) < 64 ->
      (90 - (64 - (CharInt - MoveAmt)));
      true ->
        (CharInt + MoveAmt)
  end.

encode(Str1,MoveAmt) ->
  TheChar = hd(Str1),
  CharInt = addInt(TheChar, MoveAmt),
  NewStr = tl(Str1),
  if 
        length(Str1) == 0 ->
          CharInt;
        true ->        
          CharInt + encode(NewStr, MoveAmt)
    end.

decode(Str1,MoveAmt) ->
  TheChar = hd(Str1),
  CharInt = subInt(TheChar, MoveAmt),
  NewStr = tl(Str1),
  if 
        length(Str1) == 0 ->
          CharInt;
        true ->        
          CharInt + decode(NewStr, MoveAmt)
    end.

