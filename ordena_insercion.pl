/*
	ordena_insercion(+Lista, -ListaR).
	es cierto cuando ListaR unifica con una lista que
	contiene los mismos elementos que Lista ordenados
	de menor a mayor.
	
	+ : La variable tiene que estar instanciada para que funcione (con valor).
	- : La variable tiene que estar libre (sin valor).
	? : La variable puede estar libre o instanciada.
	
*/

ordena_insercion([], []).
ordena_insercion([], ListaR):- ordena_insercion(Resto, R), insertar_ordenado(Cab, R, ListaR).



/*
	insertar_ordenado(+Elem, +Lista, -R)
		es cierto si R unifica con una lista que contiene los elementos	
		de Lista(es una lista ordenada), con Elem insertado en la
		posición correcta.
*/

insertar_ordenado(Elem, [], [Elem]).

insertar_ordenado(Elem,[Cab | Resto], [Cab | R]):- Elem > Cab, insertar_ordenado(Elem, Resto, R).

insertar_ordenado(Elem, [Cab | Resto], [Elem, Cab | Resto]):- Elem =< Cab.





