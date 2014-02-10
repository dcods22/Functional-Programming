fun addCharInt(charInt, moveAmt) =
  if(charInt < 64) then
    charInt
  else if((charInt + moveAmt) > 90) then
    64 + ((charInt + moveAmt) - 90)
  else
    charInt + moveAmt;

fun subCharInt(charInt, moveAmt) =
  if(charInt < 64) then
    charInt
  else if((charInt - moveAmt) < 64) then
    90 - (64 - (charInt - moveAmt))
  else
    charInt - moveAmt;

fun encode(str, moveAmt) =
  let
      val char = String.sub(str,0);
      val str1 = String.substring(str, 1, String.size(str) - 1)
      val charInt = addCharInt(ord(char), moveAmt)
   in
      if (String.size(str1) = 0) then Char.toString(chr(charInt))
      else String.^(Char.toString(chr(charInt)), encode(str1, moveAmt))
  end;
  
fun decode(str, moveAmt) =
  let
      val char = String.sub(str,0);
      val str1 = String.substring(str, 1, String.size(str) - 1)
      val charInt = subCharInt(ord(char), moveAmt)
  in
      if (String.size(str1) = 0) then Char.toString(chr(charInt))
      else String.^(Char.toString(chr(charInt)), decode(str1, moveAmt))
  end;
  
fun solve(str, solves) =
  let
    val csStr = "Ceaser " ^ Int.toString(solves) ^ ": "
  in
    if (solves = 0) then " \n"
    else csStr ^ encode(str, solves) ^ " \n " ^ solve(str, solves - 1)
  end;

val encodeTest = encode("123THIS IS A TEST STRING FROM", 8);
val decodeTest = decode("123BPQA QA I BMAB ABZQVO NZWU", 8);
val solveTest = solve("HAL", 26);
