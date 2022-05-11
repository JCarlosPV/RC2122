/*
	bin2gen(+Ab, -Ag)
		es cierto si Ag unifica con un árbol genérico
		equivalente al árbol binario Ab.
*/

bin2gen(a(Et, nil, nil), a(Et, [])).

bin2gen(a(Et, nil, HD), a(Et, Ag)):-
	bin2gen(HD, Ag).

bin2gen(a(Et, HI, nil), a(Et, Ag)):-
	bin2gen(HI, Ag).
	
bin2gen(a(Et, HI, HD), a(Et, [Ag1, Ag2])):-
	bin2gen(HI, Ag1),
	bin2gen(HD, Ag2).
	
	
arbol1(
  a(1, a(2, a(4, a(7,nil,nil), nil), a(5,nil,nil)), a(3, a(6,nil,nil), nil))
).