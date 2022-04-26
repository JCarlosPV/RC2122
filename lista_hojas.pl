/*
	lista_hojas(+A, -L)
		es cierto si L unifica con una lista 
		que contiene las hojas del árbol A
*/
	lista_hojas(a(Raiz, nil, nil), [Raiz]).
	lista_hojas(nil, []).
	lista_hojas(a(_, HI, HD), R):- lista_hojas(HI, R1), lista_hojas(HD, R2), append(R1, R2, R).

arbol1(
  a(a,a(b,a(d,nil,nil),a(e,nil,nil)),a(c,nil,a(f,a(g,nil,nil),nil)))
).

