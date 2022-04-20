/*
	crea_ab(+Lista, -ArbolBinario)
		es cierto si ArbolBinario unifica con
		un árbol binario que contiene los elementos
		de Lista. El árbol resultante es un árbol 
		balanceado.
*/

crea_ab([], nil).
crea_ab(Lista, a(Raiz, HI, HD)):- 
	length(Lista, L),
	M is L div 2, %Dividimos la lista entre 2 para poder crear un arbol compensado.
	length(L1, M), %Creamos una lista del tamaño resultante.
	append(L1, [Raiz | L2], Lista),
	crea_ab(L1, HI),
	crea_ab(L2, HD).