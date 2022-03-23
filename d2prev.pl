:- use_module(library(clpfd)).

/*
	d2p(D, P) 
		es cierto si P es el numero en peano equivalente al decimal D
*/

d2prev(0, 0).

%Para todo N > N0
%P(N-1) -> P(N)
%en Prolog
%P(N):- N2 is N-1, P(N2).

d2prev(D, s(P)):- D #> 0, D2 #= D - 1, d2prev(D2, P). %en P se encuentra D2 en Peano

/*
1.	Lo primero que necesito es una definición que relacione
	las variables del predicado.
	"Es cierto si..."
	
2. 	Necesio una solución para el caso más pequeño N0.

3. 	Pregunto al N-1. En la "salida" pongo una variable nueva
	y me pregunto que hay en esa variable cuando N-1 es verdad.
	A veces puede ayudarnos escribir un ejemplo.
	
4.	Si el N-1 es cierto, se que N también lo va a ser, pero qué 
	relación existe entre la "salida" del N-1 y la "salida" de N.

*/