object encode {
	
	def main(args: Array[String]) {

	}


	def addCharInt(charInt, moveAmt) : Int = {
		if(charInt < 64) 
			return charInt;
		else if((charInt + moveAmt) > 90)
		    return (64 + ((charInt + moveAmt) - 90));
		else
		   return (charInt + moveAmt);
	}

	def subCharInt(charInt, moveAmt) : Int = {
		if(charInt < 64)
		    return charInt;
		else if((charInt - moveAmt) < 64)
			return (90 - (64 - (charInt - moveAmt)));
		else
		    return (charInt - moveAmt);
	}

	def encode(str : String, moveAmt : Int) : String = {
		val charInt : Int;
		val char : Char;
		val rest : String;

		if(str.size == 0){
			'';
		}
		else{
			newChar + encode(rest, moveAmt);  
		}
	}


	def decode(str : String, moveAmt : Int) : String = {

	}


	def solve(str : String, solves : Int) : String = {

	}
}