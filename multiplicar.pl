
/*
	multiplicar(X, Y, Z)
		es cierto si Z = X * Y
*/

suma(X, 0, X).
suma(X, s(Y), s(R)):-suma(X, Y, R).

%Variable anónima 
multiplicar(_, 0, 0). 
multiplicar(X, s(Y), R) :- multiplicar(X, Y, Z), suma(Z, X, R).