(* Solving the char int based on the wrap around*)  
fun addCharInt(charInt, moveAmt) =
  if(charInt < 64) then
    charInt
  else if((charInt + moveAmt) > 90) then
    64 + ((charInt + moveAmt) - 90)
  else
    charInt + moveAmt;

(* Solving the char int based on the wrap around*)   
fun subCharInt(charInt, moveAmt) =
  if(charInt < 64) then
    charInt
  else if((charInt - moveAmt) < 64) then
    90 - (64 - (charInt - moveAmt))
  else
    charInt - moveAmt;

(* Encode function based on the move amount *)
fun encode(str, moveAmt) =
  let
      val char = String.sub(str,0);
      val str1 = String.substring(str, 1, String.size(str) - 1)
      val charInt = addCharInt(ord(char), moveAmt)
   in
      if (String.size(str1) = 0) then Char.toString(chr(charInt))
      else String.^(Char.toString(chr(charInt)), encode(str1, moveAmt))
  end;
 
(* decode function based on the move amount *) 
fun decode(str, moveAmt) =
  let
      val char = String.sub(str,0);
      val str1 = String.substring(str, 1, String.size(str) - 1)
      val charInt = subCharInt(ord(char), moveAmt)
  in
      if (String.size(str1) = 0) then Char.toString(chr(charInt))
      else String.^(Char.toString(chr(charInt)), decode(str1, moveAmt))
  end;
 
(* Solve function to show all cases of the encode*)  
fun solve(str, solves) =
  let
    val csStr = "Ceaser " ^ Int.toString(solves) ^ ": "
  in
    if (solves = 0) then "\n"
    else csStr ^ encode(str, solves) ^ " \n" ^ solve(str, solves - 1)
  end;

(*test cases *)
val encodeTest = encode("123THIS IS A TEST STRING FROM", 8);
val decodeTest = decode("123BPQA QA I BMAB ABZQVO NZWU", 8);
val solveTest = solve("HAL", 26);
print(solveTest)
