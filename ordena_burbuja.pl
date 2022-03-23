/*
	ordena_burbuja(+Lista, -ListaR).
		es cierto cuando ListaR unifica con una lista que
		contiene los mismos elementos que Lista ordenados
		de menor a mayor.
*/

ordena_burbuja(Lista, Lista):- ordenada(Lista).

	%E1 y E2 son los dos primeros elementos de Lista.
	%L1 puede ser vacio
	
ordena_burbuja(Lista, R2):-	
	append(L1,[E1,E2|Fin], Lista),  
	E1>E2,   %Si se cumple, se intercambian los elementos.
	append(L1, [E2,E1|Fin], R), %R es una lista nueva donde se guarda el nuevo 
	ordena_burbuja(R, R2).	
	
	%La induccion en este caso no tiene en cuenta el tamaño del problema, sino que queda un elemento
	%menos para ordenarla.
	
	
/*-----------------------------------------------------
	ordenada(+Lista)
		es cierto cuando Lista unifica con una lista
		que contiene sus elementos ordenados de menor a
		%mayor.
-----------------------------------------------------*/
	ordenada([]).
	ordenada([_]).
	ordenada([Cab1, Cab2|Resto]):-   
		Cab1 =< Cab2,   
		ordenada([Cab2|Resto]).

	
	