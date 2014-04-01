(defun encode (str moveAmt)
  (print (map 'string (lambda (c) 
  	(if(/= (char-code c) 32) 
			(if (>(+(char-code c) moveAmt) 90)
				(code-char(+ 64 (-(+(char-code c) moveAmt) 90)))
			(code-char(+ (char-code c) moveAmt)))
		(code-char 32)))(string-upcase str)))
)

(defun decode (str moveAmt)
	(prinT (map 'string (lambda (c) 
		(if(/= (char-code c) 32) 
			(if (<(-(char-code c) moveAmt) 65)
				(code-char(- 91 (- 65 (-(char-code c) moveAmt))))
			(code-char(- (char-code c) moveAmt)))
		(code-char 32)))(string-upcase str)))
)

(defun solve (str solves)
	(loop for num from 0 to solves do 
    (print (map 'string (lambda (c) 
      (if(/= (char-code c) 32) 
		    (if (<(-(char-code c) num) 65)
			    (code-char(- 91 (- 65 (-(char-code c) num))))
		    (code-char(- (char-code c) num)))
	    (code-char 32)))(string-upcase str))))
) 

(encode "This is A Test String" 8)

(decode "Bpqa qa i bmab ABZQVO" 8)

(solve "hal" 26)


(defun encode (str moveAmt)
	(let ((getChar (first str))))
	(let ((newStr (rest str))))
	(let ((charInt addInt (char-code getChar) moveAmt )))
	(let ((newChar (code-char charInt) )))
	(if(length newStr(== 0))
		(concatenate newChar encode(newStr moveAmt))
	)	 
	newChar
)

(defun decode (str moveAmt)
	(let ((getChar (first str))))
	(let ((newStr (rest str))))
	(let ((charInt SUBInt (char-code getChar) moveAmt )))
	(let ((newChar (code-char charInt) )))
	(if(length newStr(== 0))
		(concatenate newChar decode(newStr moveAmt))
	)	 
	newChar
)

(encode "hal" 1)