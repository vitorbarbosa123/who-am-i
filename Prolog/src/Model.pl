:- module(model, [
  renderRandom/2,
  getElemByIndex/2,
  tail/2,
  pegarPalpiteIA/2
]).

% -----------------------
% Algoritmo da IA abaixo:
% -----------------------

% Gera um número aleatório dentro do range de Lista
renderRandom(Lista, R) :- length(Lista, L), Limit is L-1, random(0, Limit, X), R is X.

% Retorna um elemento aleatório de Lista
getElemByIndex(Lista, Elem) :- renderRandom(Lista, I), nth0(I, Lista, E, _), Elem = E.

% Retorna uma lista sem o primeiro elemento
tail([_|T], T).

/* 'Funcao' que determina aleatoriamente o palpite que sera feito pelo bot, de acordo com as possibilidades restantes. Utiliza as funcoes getElemByIndex e tail.
   @Param: lista dos personagens disponiveis.*/
pegarPalpiteIA(ListaPersonagens, Palpite) :-
  getElemByIndex(ListaPersonagens, P),
  tail(P, T1),
  tail(T1, T2),
  Palpite = getElemByIndex(T2),
  write(Palpite).
