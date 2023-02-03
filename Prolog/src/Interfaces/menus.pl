/* <module> menus
*  Módulo que estabelece os menus usados pela aplicação.
*/

:- module(menus, [
  mainMenu/0,
  mainMenuSwitcher/1,
  newGameMenu/0,
  newGameSwitcher/1,
  showPlacar/0,
  tutorial/0,
  menuCharacteristics/1,
  menuCharacteristicsPxP/2
]).

:- use_module('./../Utils/utils.pl').
:- use_module('./../Modes/pvp.pl').
:- use_module('./../Modes/pve.pl').
:- use_module('./../Utils/errorHandler.pl').
:- use_module('./../Data/repository.pl').

/*
* Cada menu funciona com a sua definição e o seu switcher. 
* Menu representa o texto e o switcher as opções que o usuário pode escolher
*/
mainMenu:-
  cls,
  write("\n=========================\n"),
  write("Bem vindo ao `Who Am I?`!\n"),
  write("=========================\n"),
  write("O que voce deseja fazer?\n"),
  write("(1) Iniciar novo jogo\n"),
  write("(2) Listar pontuacoes\n"),
  write("(3) Como Jogar\n"),
  read(Choice), mainMenuSwitcher(Choice).

mainMenuSwitcher(1):- newGameMenu,!.
mainMenuSwitcher(2):- showPlacar,!.
mainMenuSwitcher(3):- tutorial,!.
mainMenuSwitcher(_):- errorHandler:error(0), mainMenu.


newGameMenu:-
  cls,
  write("\n=========================\n"),
  write("[1] Player VS BOT \n"),
  write("[2] Player VS Player \n"),
  write("[3] Retornar ao menu principal\n"),
  write("Selecione uma opcao: \n"),
  read(Choice), newGameSwitcher(Choice).

newGameSwitcher(1):- novoJogoPlayerxBot,!.
newGameSwitcher(2):- novoJogoPlayerXPlayer,!.
newGameSwitcher(3):- mainMenu,!.
newGameSwitcher(_):- errorHandler:error(0), newGameMenu.

showPlacar:-
  connect_repo,
  cls,
  write('|==============|\n'),
  write('|Nome|Pontuacao|\n'),
  findUsuarios(X),
  formatScore(X, 0),

  write('Digite qualquer valor para retornar ao menu principal\n'),
  read(_), mainMenu.
  
tutorial:-
  cls,
  write("\n==============================================\n"),
  write("Who am i? eh um jogo de turnos, você escolhe um personagem e o Bot ira receber outro personagem aleatoriamente. Onde a lista de personagens eh a mesma para ambos.\n\n"),
  write("O objetivo do jogo eh adivinhar o personagem do adversario, a cada rodada voce pode:\n"),
  write("Eliminar uma caracteristica\n"),
  write("Para vencer, é necessario adivinhar o personagem primeiro do que o Bot.\n\n"),
  write("Modos de jogo:\n"),
  write("JogadorxJogador\n"),
  write("JogadorxIA\n\n"),
  write("Informacoes importantes:\n"),
  write("Voce e o bot podem escolher o mesmo personagem.\n"),
  write("Se voce escolher chutar e errar, voce perde a rodada.\n\n"),
  write("Digite qualquer valor para retornar ao menu principal\n"),
  read(_), mainMenu.

menuCharacteristics(EscolhaJogador):-
  write("\n Qual caracteristica voce deseja escolher? \n"),
  write("[0] sexo | [1] cor do cabelo | [2] etnia | [3] cor dos olhos | [4] acessorio\n"),
  read(Choice), characteristicsSwitcher(Choice, EscolhaJogador).

characteristicsSwitcher(0, X):-
  write("Qual o sexo?\n"),
  read(X).
characteristicsSwitcher(1, E):-
  write("Qual a cor do cabelo?\n"),
  read(X),
  E = X.
characteristicsSwitcher(2, E):-
  write("Qual a etnia?\n"),
  read(X),
  E = X.
characteristicsSwitcher(3, E):-
  write("Qual a cor dos olhos?\n"),
  read(X),
  E = X.
characteristicsSwitcher(4, E):-
  write("Qual a Qual o acessório?\n"),
  read(X),
  E = X.

menuCharacteristicsPxP(Usuario, EscolhaJogador):-
  write("\n Qual caracteristica voce deseja escolher "), writeln(Usuario),
  write("[0] sexo | [1] cor do cabelo | [2] etnia | [3] cor dos olhos | [4] acessorio\n"),
  read(Choice), characteristicsPxPSwitcher(Choice, EscolhaJogador).

  characteristicsPxPSwitcher(0, X):-
  write("Qual o sexo?\n"),
  read(X).
characteristicsPxPSwitcher(1, E):-
  write("Qual a cor do cabelo?\n"),
  read(X),
  E = X.
characteristicsPxPSwitcher(2, E):-
  write("Qual a etnia?\n"),
  read(X),
  E = X.
characteristicsPxPSwitcher(3, E):-
  write("Qual a cor dos olhos?\n"),
  read(X),
  E = X.
characteristicsPxPSwitcher(4, E):-
  write("Qual a Qual o acessório?\n"),
  read(X),
  E = X.

  