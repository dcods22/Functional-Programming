-module(encode1).
-export([addInt/2, subInt/2,start/0]).

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

encode(Str1,MoveAmt) ->
  	TheChar = string:substr(Str1,1,1),
  	CharInt = addInt(TheChar, MoveAmt),
  	NewStr = string:substr(Str1,2),
  	if 
	  length(Str1) == 0 ->
      	CharInt;
      true ->        
       	CharInt + encode(NewStr, MoveAmt)
	end.

start() ->
    io:write(encode("HAL",1)),
    io:fwrite("\n").
