object encode {
	
	//main method
	def main(args: Array[String]) {
		//test strings
		val Estr : String = "THIS IS A TEST STRING FROM1122@";
		val Dstr : String = "BPQA QA I BMAB ABZQVO NZWU1122@";
		val Sstr : String = "HAL@";

		//main 
		println(encode(Estr, 8));
		println(decode(Dstr, 8));
		println(solve(Sstr, 26));
	}

	//method to figure out char int for encode
	def addCharInt(charInt : Int, moveAmt : Int) : Int = {
		//check if letter
		if(charInt <= 64) 
			return charInt;
		//wrap around
		else if((charInt + moveAmt) > 90)
		    return (64 + ((charInt + moveAmt) - 90));
		//no wrap
		else
		   return (charInt + moveAmt);
	}

	//method to figure out char int for decode
	def subCharInt(charInt : Int, moveAmt : Int) : Int = {
		//check if letter
		if(charInt <= 64)
		    return charInt;
		//wrap around
		else if((charInt - moveAmt) < 64)
			return (90 - (64 - (charInt - moveAmt)));
		//no wrap around
		else
		    return (charInt - moveAmt);
	}

	def encode(str : String, moveAmt : Int) : String = {
		//vals for the char, rest of the string, char int and final char
		val char : Char = str.charAt(0);
		val rest : String = str.substring(1, str.size);
		val charInt : Int = addCharInt(char.toInt, moveAmt);
		val newChar : Char = charInt.toChar;

		//check for recurseive call
		if(rest.size == 0){
			return newChar.toString;
		}
		else{
			newChar.toString + encode(rest, moveAmt);  
		}
	}


	def decode(str : String, moveAmt : Int) : String = {
		//vals for the char, rest of the string, char int and final char
		val char : Char = str.charAt(0);
		val rest : String = str.substring(1, str.size);
		val charInt : Int = subCharInt(char.toInt, moveAmt);
		val newChar : Char = charInt.toChar;

		//check for recursive call
		if(rest.size == 0){
			return newChar.toString;
		}
		else{
			newChar.toString + decode(rest, moveAmt);  
		}
	}


	def solve(str : String, solves : Int) : String = {
		//check for recursive call
		if (solves == -1) 
			return "\n";
		//call encode and recursive call
    	else 
    		"Ceaser " + solves.toString() + ": " + encode(str, solves) + " \n" + solve(str, solves - 1);
	}
}