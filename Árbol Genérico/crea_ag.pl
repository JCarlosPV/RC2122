/*
	crea_ag(+ListaEt, -A)
		es cierto si A unifica con un árbol
		genérico que contiene las etiquetas
		de ListaET.
*/

%Crea un arbol generico pero por una rama

crea_ag([E], a(E, [])).

crea_ag([Cab | Resto], a(Cab, [AResto])):-
	length([Cab | Resto], LL),
	LL > 1,
	crea_ag(Resto, AResto).


	
crea_ag2([E], a(E, [])). %1 elemento

crea_ag2([E1, E2], a(E1, [a(E2, [])])). %2 elementos

crea_ag2([Cab | Resto], a(Cab, [A1, A2])):- %+3 elementos
	length([Cab | Resto], L),
	L > 2, %Minimo tiene que tener 3 elementos la lista porque el resto tiene que ser 2.
	length(Resto, LL),
	Mitad is LL div 2,
	length(L1, Mitad),
	append(L1, L2, Resto),
	crea_ag2(L1, A1),
	crea_ag2(L2, A2).
	


/*
	crea_agN(+N, +ListaEt, -A)
		es cierto si A unficia con un árbol 
		genérico que contiene todas las etiquetas
		de ListaEt con un máximo de N hijos por nivel.
*/

crea_agN(1, [E], a(E, []).
crea_agN(2, [E1, E2], a(E1, [a(E2, [])])).

crea_agN(N, [Cab | Resto], ):-
	length(L, N),
	append(L, LResto, Resto),
	crea_agN(1, LResto, A1).
	
	
crea_arbol_NHijos(N, [Cab | Resto], ):-
	
	
	

	
	

