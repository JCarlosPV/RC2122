/*

	num_elem(Lista, N)
		es cierto si N unifica con el número de elementos de Lista

*/

num_elem([], 0).

num_elem([ _ | Resto], N2):- num_elem(Resto, N), N2 is N + 1.