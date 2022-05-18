/*
	Problemas de Estados
	
	1.- Definir el estado
		estado(L5, L3)
		
	2.- Definir estado inicial/final
		Inicial -> estado(0,0).
		Final   -> estado(4, _).
		
	3.- Movimientos
		3.1 Llenar L5
		3.2 Llenar L3
		3.3 Vaciar L5
		3.4 Vaciar L3
		3.5 L5aL3
		3.6 L3aL5

		mov(NombreDeMov, EstadoAntes, EstadoDespues)
	
	4.- Construir camino a la solucion
	
	5.- Llamada al camino
		camino(estado(0, 0), estado(4, _), [estado(0, 0)], Camino).
*/

mov(llenarl5, estado(_, L3), estado(5, L3)).

mov(llenarl3, estado(L5, _), estado(L5, 3)).

mov(vaciarl5, estado(_, L3), estado(0, L3)).

mov(vaciarl3, estado(L5, _), estado(L5, 0)).

mov(l5al3, estado(L5, L3), estado(0, T)):- T is L5+L3, T =< 3.

mov(l5al3, estado(L5, L3), estado(T2, 3)):- T is L5+L3, T > 3, T2 is T - 3.

mov(l3al5, estado(L5, L3), estado(T, 0)):- T is L5 + L3, T =< 5.

mov(l3al5, estado(L5, L3), estado(5, T2)):- T is L5 + L3, T > 5, T2 is T - 5.

/*

	camino(+EstadoInicial, +EstadoFinal, +Visitados, -Camino)
		es cierto si Camino unifica con la lista de movimientos
		necesarios para pasar del EstadoInicial al EstadoFinal
		sin repetir los estados de la lista Visitados. (Visitados es una lista de estados).
*/

camino(Ei, Ei, _, []).

camino(Ei, Ef, Visitados, [NombreDeMov | Camino]):-
	mov(NombreDeMov, Ei, Etmp),
	\+ member(Etmp, Visitados),
	camino(Etmp, Ef, [Etmp | Visitados], Camino).
