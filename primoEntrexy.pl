/*
	primoEntrexy(+X, +Y, -ListaPrimos)
		es cierto si ListaPrimos unifica con los números primos que hay 
		entre X e Y (ambos inclusive) en orden ascendente.
*/

primoEntrexy(X, X, []).

primoEntrexy(X, Y, [X | R]):- X < Y, X2 is X + 1, primoEntrexy(X2, Y, R), primo(X).
primoEntrexy(X, Y, R):- X < Y, X2 is X + 1, primoEntrexy(X2, Y, R), \+ primo(X).
 




/*
	lista_divisores(+X, +Y, -ListaR).
		es cierto cuando ListaR unifica con una lista
		que contiene a los números cuyo resto
		de la división entera de X entre Z es igual a 0
		para valores de Z entre 1 e Y.
*/

lista_divisores(_, 1, [1]).
lista_divisores(X, Y, [Y | R]):- Y > 1, X1 is X mod Y, X1 = 0, Y2 is Y-1, lista_divisores(X, Y2, R).
lista_divisores(X, Y, R):- Y > 1, X1 is X mod Y, X1 \= 0, Y2 is Y-1, lista_divisores(X, Y2, R).


/*
	primo(X)
		es cierto si X unifica con un número primo.
*/

primo(X):- lista_divisores(X, X, [X, 1]).


















