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
  NewChar = hd(Str1);
  CharInt = addInt(NewChar, MoveAmt);
  NewStr = tl(Str1);
  if 
        len(Str1) == 0 ->
          NewChar;
        true ->        
          NewChar + encode(NewStr, MoveAmt)
    end.

decode(Str1,MoveAmt) ->
  NewChar = hd(Str1);
  CharInt = subInt(NewChar, MoveAmt);
  NewStr = tl(Str1);
  if 
        len(Str1) == 0 ->
          NewChar;
        true ->        
          NewChar + decode(NewStr, MoveAmt)
    end.

