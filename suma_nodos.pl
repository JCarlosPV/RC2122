/*
	suma_nodos(+Arbol, -N)
		es cierto si N unifica conla suma 
		de las etiquetas de Arbol.
*/

suma_nodos(nil, 0).
suma_nodos(a(Raiz, HI, HD), R):- 
	suma_nodos(HI, RI), 
	suma_nodos(HD, RD), 
	R is RI + RD + Raiz.
	
arbol1(
  a(1, a(2, a(4, a(7,nil,nil), nil), a(5,nil,nil)), a(3, a(6,nil,nil), nil))
).