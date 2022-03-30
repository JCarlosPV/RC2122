/*
	permuta(+Lista, -ListaR).
	es cierto cuando ListaR unifica con una lista
	que contiene los elementos de Lista en orden
	distinto. Este predicado genera todas las
	listas posibles por backtraking.
*/
permuta([], []).
permuta([Cab | Resto], R2):- permuta(Resto, R), insertar_todas_pos(Cab, R, R2).



/*
	selecciona_uno(+Lista, -Elem, -Resto)
		es cierto cuando Elem unifica con cualquier
		elemento de la lista Lista y Resto unifica
		con una lista que contiene los elementos de
		Lista, en el mismo orden menos el elemento Elem.
*/

selecciona_uno([Cab | Resto], Cab, Resto).
selecciona_uno([Cab | Resto], Elem, [Cab | RLista]):- selecciona_uno(Resto, Elem, RLista).


/*
	insertar_todas_pos(+Elem, +Lista, -ListaF)
		es cierto cuando Elem ListaF unifica en cada posición de Lista a Elem.
*/

insertar_todas_pos(Elem, Resto, [Elem | Resto]).
insertar_todas_pos(Elem, [Cab | Resto], [Cab | RestoF]):- insertar_todas_pos(Elem, Resto, RestoF).





















