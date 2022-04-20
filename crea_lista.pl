/*
	crea_lista(+N, -L)
		es cierto si L unifica con una lista de valores que van desde 1 hasta N
		ordenados de menor a mayor.
*/

	crea_lista(0, []).
	crea_lista(N, R2):-
		N2 is N-1, 
		crea_lista(N2, R),
		append(R, [N], R2).