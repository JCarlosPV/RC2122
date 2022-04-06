
/*
	blocks(+L1, +L2, +L3)
		es cierto si los loques que forman
		las 3 listas de longitud 9
		tienen elementos distintos de 1..9
*/

:- use_module(library(clpfd)).

blocks([], [], []).

blocks([N1, N2, N3 | Resto1], [N4, N5, N6 | Resto2], [N7, N8, N9 | Resto3]):- 
	all_distinct([N1, N2, N3, N4, N5, N6, N7, N8, N9]),
	blocks(Resto1, Resto2, Resto3).
	
/*
	append([Lista], []).
		Recibe una lista de lista y devuelve todas las variables dentro
		de una lista.
	
	[1, 2], [4] --> [1, 2, 4]
*/

/*
	maplist(Goal, List).
		devuelve True cuando la lista cumple con lo que dice Goal.
		maplist(all_distinct, [1, 2, 3]) --> True
*/

sudoku(Rows):- 
	length(Rows, 9), %Crea una lista de 9 posiciones 
	maplist(same_length(Rows), Rows), %Crea el mismo numero de lista que distancia tiene Rows --> Crea 9 listas.
	append(Rows, Var). %Append unifica todos los elementos de todas las listas en una lista (Var).
	%Var ins 1..9.
	%maplist(all_distinct, Rows). %Comprueba que todos los elementos en Rows, sean distintos.
	

	