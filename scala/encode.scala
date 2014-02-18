object encode {
	
	def main(args: Array[String]) {
		val Estr : String = "THIS IS A TEST STRING FROM1122@";
		val Dstr : String = "BPQA QA I BMAB ABZQVO NZWU1122@";
		val Sstr : String = "HAL@";

		//main 
		println(encode(Estr, 8));
		println(decode(Dstr, 8));
		//solve(Sstr, 26);
	}

	def addCharInt(charInt : Int, moveAmt : Int) : Int = {
		if(charInt <= 64) 
			return charInt;
		else if((charInt + moveAmt) > 90)
		    return (64 + ((charInt + moveAmt) - 90));
		else
		   return (charInt + moveAmt);
	}

	def subCharInt(charInt : Int, moveAmt : Int) : Int = {
		if(charInt <= 64)
		    return charInt;
		else if((charInt - moveAmt) < 64)
			return (90 - (64 - (charInt - moveAmt)));
		else
		    return (charInt - moveAmt);
	}

	def encode(str : String, moveAmt : Int) : String = {
		val char : Char = str.charAt(0);
		val rest : String = str.substring(1, str.size);
		val charInt : Int = addCharInt(char.toInt, moveAmt);
		val newChar : Char = charInt.toChar;

		if(rest.size == 0){
			return newChar.toString;
		}
		else{
			newChar.toString + encode(rest, moveAmt);  
		}
	}


	def decode(str : String, moveAmt : Int) : String = {
		val char : Char = str.charAt(0);
		val rest : String = str.substring(1, str.size);
		val charInt : Int = subCharInt(char.toInt, moveAmt);
		val newChar : Char = charInt.toChar;

		if(rest.size == 0){
			return newChar.toString;
		}
		else{
			newChar.toString + decode(rest, moveAmt);  
		}
	}


	/*def solve(str : String, solves : Int) : String = {

	}*/
}