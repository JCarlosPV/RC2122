/*
	recorrido_anchura(+Arbol, -L)
		es cierto si L unifica con los nodos del árbol
		recorrido en anchura.
*/

recorrido_anchura(a(Et, ListaHijos), [Et | R]):-
	recorrido_anchura(ListaHijos, R).
	
	
/*
	recorrido_anchura(+ListaArboles, -ListaSalida)
		es cierto si ListaSalida 
*/

recorrido_anchura([], []).

recorrido_anchura([a(Et, ListaHijos) | Resto], [Et | R] ):-
	append(Resto, ListaHijos, NuevoArbol),
	recorrido_anchura(NuevoArbol, R).
	
arbol1( a(1, [a(2,[]), a(3,[]), a(4,[])]) ).

arbol2( a(1, [a(2,[a(5,[]), a(6,[])]), a(3,[]), a(4,[])]) ).  
	

	