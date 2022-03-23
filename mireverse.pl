/*
	reverse(+List, -ListR)
		es cierto cuando ListR unifica con una lista que contiene los 
		mismos elementos que List pero en orden inverso.
*/


mireverse([], []).
mireverse([ Cab | Resto], ListaR):-mireverse(Resto, R), ins_final(Cab, R, ListaR).


/*
	ins_final(Elem, Lista, R)
		es cierto si R unifica con una lista que contiene los elementos de Lista 
		con Elem insertado al final.
*/
ins_final(Elem,[], [Elem]).
ins_final(Elem, [ Cab | Resto ], [Cab | R]):- ins_final(Elem, Resto, R). 
