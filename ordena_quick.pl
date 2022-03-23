/*
	ordena_quick(+Lista, -ListaR)
		es cierto cuando ListaR unifica con una lista que contiene 
		los mismos elementos que Lista ordenados de menor a mayor.	
*/

ordena_quick([], []).
ordena_quick([Cab | Resto], R):- partition(Cab, Resto, Menores, Mayores), 
	ordena_quick(Menores, ListaMen), 
	ordena_quick(Mayores, ListaMay), 
	append(ListaMen, [Cab | ListaMay], R).


/*
	partition(+Elem, +Lista, -Menores, -Mayores)
		es cierto cuando Menores unifica con una lista que
		contiene los elemenentos de Lista que son menores
		o iguales que Elem y Mayores unifica con una lista
		que contiene los elementos de Lista que son mayores que Elem.
*/		

partition(_, [], [], []).

partition(Elem, [Cab | Resto], Menores, [Cab | Mayores]):- Elem =< Cab, partition(Elem, Resto, Menores, Mayores).
partition(Elem, [Cab | Resto], [Cab | Menores], Mayores):- Elem > Cab, partition(Elem, Resto, Menores, Mayores).
