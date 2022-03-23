
/*
	suma(X, Y, Z)
		es certo si Z = X + Y
		
*/

suma(X, 0, X).
suma(X, s(Y), s(R)):-suma(X, Y, R).