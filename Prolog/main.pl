% -----------------------
% Algoritmo da IA abaixo:
% -----------------------

renderRandom(Lista, R) :- length(Lista, L), Limit is L-1, random(0, Limit, X), R is X.

getElemByIndex(Lista, Elem) :- renderRandom(Lista, I), nth0(I, Lista, E, _), Elem = E.

tail([_|T], T).

/* Funcao que determina aleatoriamente o palpite que sera feito pelo bot, de acordo com as possibilidades restantes. Utiliza as funcoes getElemByIndex e tail.
   @Param: lista dos personagens disponiveis.*/
pegarPalpiteIA(ListaPersonagens, Palpite) :- getElemByIndex(ListaPersonagens, P), tail(P, T1), tail(T1, T2), Palpite = getElemByIndex(T2).
