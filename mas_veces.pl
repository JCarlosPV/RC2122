/*
	mas_veces(+Lista, -Elem, -Num)
		es cierto si Elem unifica con el numero
		que se repite más veces en Lista
		y Num unifica con el número de veces que se
		repite dicho elemento.
*/

mas_veces([], _, 0).
mas_veces([(X, N)], X, N).
mas_veces(Lista, Elem, N):- msort(Lista, RO), comprime(RO, R), mayor(R, Elem, N).


/*
	mayor(+Lista, -Elem, -N)
		es cierto si Elem unifica con 
		el elemento que se repita 
		mas veces en Lista y N unifica con el 
		número de veces que se repite.
*/

mayor([], _, 0).
mayor([(Cab, N) | Resto], Cab, N):- mayor(Resto, _, N2), N > N2.
mayor([(_, N) | Resto], E, N2):- mayor(Resto, E, N2), N =< N2.


%[(a, 2), (b, 1), (c, 3)]

/*
	comprime(+Lista, -R)
		es cierto si R unifica una lista de la siguiente forma:
		comprime([a, a, b, b, b, c, d, d], R).
		R = [(a, 2), (b, 3), (c, 1), (d, 2)]
*/

comprime([], [(_, 0)]).
comprime([Elem], [(Elem, 1)]).

comprime([Cab, Cab | Resto], [(Cab, N2) | R]):- 
	comprime([Cab | Resto], [(Cab, N) | R]),
	N2 is N + 1.

comprime([Elem1, Elem2 | Resto],[(Elem1, 1) | R]):- 
	Elem1 \= Elem2, 
	comprime([Elem2 | Resto], R).
	

