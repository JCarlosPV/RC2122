/*
	d2p_cl(D, P) 
		es cierto si P es el numero en peano equivalente al decimal D
*/



/*

%Induccion en el primer elemento.
d2p_cl2(0, 0).
d2p_cl2(D, s(P)):- D > 0, D2 is D - 1, d2p_cl2(D2, P).

*/


%Reversible sin librería
%Induccion en el segundo elemento.
d2p_cl(0, 0).
d2p_cl(D2, s(P)):- d2p_cl(D, P), D2 is D + 1.

