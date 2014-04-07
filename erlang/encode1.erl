-module(encode1).
-export([addInt/2, subInt/2, encode/2, decode/2, solve/2]).
-import(string, [to_upper/1, concat/2]).

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
        (CharInt - MoveAmt)
 	end.

encode("", MoveAmt) -> "";
encode(Str1, MoveAmt) ->
  	TheCharInt = hd(Str1),
  	CharInt = addInt(TheCharInt, MoveAmt),
  	NewStr = tl(Str1),
  	if 
	  length(NewStr) == 0 ->
      	[CharInt];
      true ->        
       	string:concat([CharInt], encode(NewStr, MoveAmt))
	end.

decode("", MoveAmt) -> "";
decode(Str1, MoveAmt) ->
    TheCharInt = hd(Str1),
    CharInt = subInt(TheCharInt, MoveAmt),
    NewStr = tl(Str1),
    if 
    length(NewStr) == 0 ->
        [CharInt];
      true ->        
        string:concat([CharInt], decode(NewStr, MoveAmt))
  end.

solve(Str1, 0) -> io:fwrite(encode(Str1, 0));
solve(Str1, Solves) ->
    io:fwrite(encode(Str1, Solves)),
    io:fwrite("\n"),
    solve(Str1, (Solves -1)).

    