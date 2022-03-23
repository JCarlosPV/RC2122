/*
	d2p(D, P) 
		es cierto si P es el numero en peano equivalente al decimal D
*/

%P(n)
d2p(0, 0).

%Para todo N > N0
%P(N-1) -> P(N)
%en Prolog
%P(N):- N2 is N-1, P(N2).

d2p(D, s(P)):- D > 0, D2 is D - 1, d2p(D2, P).


