/* <module> pvp
*  Módulo respectivo ao modo de jogo: Jogador vs Jogador
*/
:- module(pvp, [
  novoJogoPlayerXPlayer/0,
  jogoPxP/2,
  partidaPxP/8,
  vitoria/3
]).

:- use_module('./../Interfaces/menus.pl').
:- use_module('./../Interfaces/headers.pl').

:- use_module('./../Utils/utils.pl').
:- use_module('./../Utils/helpers.pl').
:- use_module('./../Utils/errorHandler.pl').

:- use_module('./../Data/repository.pl').

% Inicia um novo jogo entre dois jogadores humanos
novoJogoPlayerXPlayer:-
  headers:newGameHeader,
  write('Digite o nome do Jogador 1: '),
  read(Username1),

  write('Digite o nome do Jogador 2: '),
  read(Username2),

  findOrCreateUser(Username1, User1),
  findOrCreateUser(Username2, User2),

  jogoPxP(Username1,Username2).

jogoPxP(Username1,Username2):-
  cls,
  line,
  findPersonas(ListPersonas),
  formatTable(ListPersonas, 0),

  write("Digite o número do ID do seu personagem, "), writeln(Username1),
  read(IdUser1),
  IndiceJogador1 is IdUser1-1,
  nth0(IndiceJogador1, ListPersonas, PersonaJogador1),
  
  line,
  formatTable(ListPersonas, 0),
  write("Agora digite o número do ID do seu personagem, "), writeln(Username2),
  read(IdUser2),
  IndiceJogador2 is IdUser2-1,
  nth0(IndiceJogador2, ListPersonas, PersonaJogador2),
  line,

  menuCharacteristicsPxP(Username1, PalpiteJogador1),
  menuCharacteristicsPxP(Username2, PalpiteJogador2),

  partidaPxP(Username1, Username2, PalpiteJogador1, PalpiteJogador2, PersonaJogador1, PersonaJogador2, ListPersonas, ListPersonas).

/*
* Inicia uma rodada de jogo PxP
  @param Username1, nome do jogador1
  @param Username2, nome do jogador2
  @param PalpiteJogador1, palpite do jogador1
  @param PalpiteJogador2, palpite do jogador2
  @param PersonaJogador1, personagem selecionado pelo jogador1
  @param PersonaJogador2, personagem selecionado pelo jogador2
  @param ListPersonas1, lista com todos os personagens possíveis para o jogador1
  @param ListPersonas2, lista com todos os personagens possíveis para o jogador2
 */ 
partidaPxP(Username1, Username2, PalpiteJogador1, PalpiteJogador2, PersonaJogador1, PersonaJogador2, ListPersonas1, ListPersonas2):-
  cls,
  verificarPalpite(ListPersonas1, PalpiteJogador1, PersonaJogador2,[], Result),
  writeln("Lista Jogador 1 "),
  line,
  formatFilterTable(Result, 0),
  length(Result, R),
  (
    1 >= R -> vitoria(Username1, Username2, PersonaJogador2);
    verificarPalpite(ListPersonas2, PalpiteJogador2, PersonaJogador1,[], NewResult),
    writeln("Lista Jogador 2 "),
    line,
    formatFilterTable(NewResult, 0),
    (
      1 >= R -> vitoria(Username2, Username1, PersonaJogador1);
      menuCharacteristicsPxP(Username1, NovoPalpiteJogador1),
      menuCharacteristicsPxP(Username2, NovoPalpiteJogador2),
      partidaPxP(Username1, Username2, NovoPalpiteJogador1, NovoPalpiteJogador2, PersonaJogador1, PersonaJogador2, Result, NewResult)
    )
    ).

% Informa e registra o vencedor do jogo PxP
vitoria(Vencedor, Vencido, PersonaVencido):-
  incrementUserScore(Vencedor),
  cls,
  victoryGameHeader,
  write('PARABENS '),
  write(Vencedor),
  write(' ! VOCE GANHOU!\n'),
  write('O personagem de '),
  write(Vencido),
  write(' era: '),
  write(PersonaVencido),
  write('.\n'),
  write('Pressione . para voltar ao menu principal...\n'),
  read(_),
  write('\n').