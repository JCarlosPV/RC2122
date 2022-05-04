/*
	cuenta_nodos(+Arbol, -N)
		es cierto si N unifica con el numero de nodos de Arbol.
*/

cuenta_nodos(a(_, ListaHijos), R):-
	cuenta_nodos_lh(ListaHijos, RL),
	R is RL + 1.
	
	
	
/*
	cuenta_nodos_lh(+ListaHijos, -N)
		es cierto si N unifica con el número de nodos de las 
		listas de árboles genéricos ListaHijos.
*/

cuenta_nodos_lh([], 0).
cuenta_nodos_lh([Cab | Resto], R):-
	cuenta_nodos_lh(Resto, RResto),
	cuenta_nodos(Cab, RCab),
	R is RResto + RCab.
	


arbol1( a(1, [a(1, []), a(2, []), a(3, [])]) ).