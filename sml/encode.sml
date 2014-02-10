fun encode(str, moveAmt) =
  let
      val char = String.sub(str,0);
      val str1 = String.substring(str, 1, String.size(str) - 1)
      val charInt = ord(char) + moveAmt
	 in
      	if (String.size(str1) = 0) then Char.toString(chr(charInt))
      	else if ((charInt - moveAmt) = 32) then String.^(Char.toString(chr(32)), encode(str1, moveAmt))
      	else if ((charInt - moveAmt) < 65) then String.^(Char.toString(chr(charInt - moveAmt)), encode(str1, moveAmt))
	    else if (charInt > 90) then String.^(Char.toString(chr((64 + (charInt - 90)))), encode(str1, moveAmt))
	    else String.^(Char.toString(chr(charInt)), encode(str1, moveAmt))
	end;
  
fun decode(str, moveAmt) =
  let
   		val char = String.sub(str,0);
  		val str1 = String.substring(str, 1, String.size(str) - 1)
		val charInt = ord(char) - moveAmt
	in
   		if (String.size(str1) = 0) then Char.toString(chr(charInt))
   		else if ((charInt + moveAmt) = 32) then String.^(Char.toString(chr(32)), encode(str1, moveAmt))
   		else if ((charInt + moveAmt) < 65) then String.^(Char.toString(chr(charInt + moveAmt)), encode(str1, moveAmt))
		else if (charInt < 64) then String.^(Char.toString(chr((90 - (64 - charInt)))), encode(str1, moveAmt))
		else String.^(Char.toString(chr(charInt)), encode(str1, moveAmt))
	end;
  
val encodeTest = encode("123THIS IS A TEST STRING FROM", 8);
val decodeTest = decode("123BPQA QA I BMAB ABZQVO NZWU", 8);

