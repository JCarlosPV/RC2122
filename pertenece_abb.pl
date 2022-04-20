/*
	pertenece_abb(+N, +Arbol)
		es cierto si N pertenece a Arbol.
*/

pertenece_abb(N, a(N, _, _)).
pertenece_abb(N, a(Raiz, HI, _)):- N \= Raiz, pertenece_abb(N, HI).
 pertenece_abb(N, a(Raiz, _, HD)):- N\=Raiz, pertenece_abb(N, HD).

arbol(
	a(3, a(2, a(1, nil, nil), nil), a(4, nil, nil))
).