/*
	cuenta_hojas(+Arbol, -N).
		es cierto si N unifica con el numero
		de hojas de Arbol.
*/

/*
cuenta_hojas(a(_, nil, nil), 1).


cuenta_hojas(a(_, HI, HD), R):- 
	HI \= nil, HD \=nil,
	cuenta_hojas(HI, RI),
	cuenta_hojas(HD, RD),
	R is RI + RD.
	
cuenta_hojas(a(_, nil, HD), RD):- 
	HD \=nil,
	cuenta_hojas(HD, RD).
	
cuenta_hojas(a(_, HI, nil), RI):- 
	HI \= nil,
	cuenta_hojas(HI, RI).
	
*/	

	hoja(a(_, nil, nil)).
	
	cuenta_hojas(nil, 0).
	cuenta_hojas(A, 1):- hoja(A).
	cuenta_hojas(A, R):- A=a(_, HI, HD), not(hoja(A)),
		cuenta_hojas(HI, RI),
		cuenta_hojas(HD, RD),
		R is RI + RD.


arbol1(
  a(a, a(b, a(d, a(g,nil,nil), nil), a(e,nil,nil)), a(c, a(f,nil,nil), nil))
).