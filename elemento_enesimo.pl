/*
	elemento_enesimo(+Pos,  +Lista,  -Elem) 
		que es cierto cuando Elem unifica con el elemento que ocupa la posición Pos dentro de Lista.
*/

elemento_enesimo(0, [X | _ ], X).
elemento_enesimo(Pos2, [ _ | Resto], R):- elemento_enesimo(Pos, Resto, R), Pos2 is Pos + 1.