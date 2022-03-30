/*
	mas_veces(+Lista, -Elem, -Num)
		es cierto si Elem unifica con el numero
		que se repite más veces en Lista
		y Num unifica con el número de veces que se
		repite dicho elemento.
*/

%mas_veces([X], X, 1).
%mas_veces([Cab | Resto], , ):- 


/*
	comprime(+Lista, -R)
		es cierto si R unifica una lista de la siguiente forma:
		comprime([a, a, b, b, b, c, d, d], R).
		R = [(a, 2), (b, 3), (c, 1), (d, 2)]
*/

comprime([], [(_, 0)]).
comprime([Cab 


