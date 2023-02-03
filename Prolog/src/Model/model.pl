:- module(model, [
  renderRandom/2,
  getElemByIndex/2,
  tail/2,
  pegarPalpiteIA/2
]).

:- use_module('./../Data/repository.pl').

/*
  Algoritmo de decisao da IA abaixo.
*/

/*
  Clausula para gerar um numero aleatorio dentro do range da lista.
*/
renderRandom(Lista, R) :- 
  connect_repo,
  length(Lista, L), Limit is L-1, random(0, Limit, X), R is X.

/*
  Clausula que retorna um elemento aleatorio da lista.
*/
getElemByIndex(Lista, Elem) :- 
  connect_repo,
  renderRandom(Lista, I), nth0(I, Lista, E, _), Elem = E.


/*
  Clausula que retorna a lista sem o primeiro elemento.
*/
tail([_|T], T).

/*
  Clausula que determina aleatoriamente o palpite do bot,
  de acordo com as possibilidades restantes.
  @Param: lista dos personagens disponveis
*/
pegarPalpiteIA(ListaPersonagens, Palpite) :-
  connect_repo,
  findPersonas(ListaPersonagens),
  getElemByIndex(ListaPersonagens, P),
  tail(P, T1),
  tail(T1, T2),
  Palpite = getElemByIndex(T2),
  write(Palpite).
