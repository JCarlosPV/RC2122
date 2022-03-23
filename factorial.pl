%Mi primer programa en prolog

/* 
	Primer ejemplo en prolog.
	
	Factorial
	
	factorial(N, R).
		es cierto si R es el factorial de N.
	
	
*/

factorial(1,1).

factorial(N, R2):- N > 1, N2 is N - 1, 
				factorial(N2, R), 
				R2 is N*R.