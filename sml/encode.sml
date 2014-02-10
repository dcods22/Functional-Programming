fun encode(str, moveAmt) =
  let
    val char = String.sub(str,0);
		val str1 = String.substring(str, 0, String.size(str) - 1)
		val charInt = ord(char)
	in
    if (String.size(str1) = 0) then Char.toString(chr(charInt))
		else if (charInt > 90) then String.^(Char.toString(chr((64 + (90 - charInt)))), encode(str1, moveAmt))
		else String.^(Char.toString(chr(charInt)), encode(str1, moveAmt))
	end;
  
val encodeTest = encode("test", 1);