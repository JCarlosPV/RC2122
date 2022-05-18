/*
	Problemas de Estados
	
	1.- Definir el estado
		estado(NumMisDcha, NumCanDcha, PosBarca).
		
	2.- Definir estado inicial/final
		Inicial -> estado(3, 3, dch).
		Final   -> estado(0, 0, izq).
		
	3.- Movimientos
		
		mov(llevar(M, C, dir), EstadoAntes, EstadoDespues)
	
	4.- Construir camino a la solucion
	
	5.- Llamada al camino
		camino(estado(0, 0), estado(4, _), [estado(0, 0)], Camino).
*/

	mov(llevar(M, C, izq), estado(MD, CD, dch), estado(MD2, CD2, izq)):-
		MD2 is MD-M, CD2 is CD - C,
		valido(estado(MD2, CD2, izq)).
		
	mov(llevar(M, C, dch), estado(MD, CD, izq), estado(MD2, CD2, dch)):-
		MD2 is MD-M, CD2 is CD-C,
		valido(estado(MD2, CD2, dch)).
		
	llevar(1, 0, _).
	llevar(0, 1, _).
	llevar(1, 1, _).
	llevar(2, 0, _).
	llevar(0, 2, _).
	
	valido(estado(MD, CD, dch)):- 
		MD > 0, MD >= CD,
		MI is 3 - MD,
		CI is 3 - CD,
		MI >= CI, CI > 0.
	
	valido(estado(0, _, _)).
	valido(estado(3, _, _)).
	
	camino(Ei, Ei, _, []).
	camino(Ei, Ef, Visitados, [llevar(M, C, Dir) | Camino]):-
		mov(llevar(M, C, Dir), Ei, Etmp),
		\+ member(Etmp, Visitados),
		camino(Etmp, Ef, [Etmp | Visitados], Camino).
	