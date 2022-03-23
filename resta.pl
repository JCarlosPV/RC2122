
/*
	resta(X, Y, Z)
		es cierto si Z = X - Y
*/

resta(X, 0, X).

%     N                N-1
resta(X, s(Y), R) :- resta(X, Y, s(R)).

