:- module(interfaces, [
  mainMenu/0,
  mainMenuSwitcher/1,
  newGameMenu/0,
  newGameSwitcher/1,
  tutorial/0
]).

:- use_module('./utils.pl').
:- use_module('./pvp.pl').
:- use_module('./errorHandler.pl')

mainMenu:-
  write("\n=========================\n"),
  write("Bem vindo ao `Who Am I?`!\n"),
  write("=========================\n"),
  write("O que voce deseja fazer?\n"),
  write("(1) Iniciar novo jogo\n"),
  write("(2) Listar pontuacoes\n"),
  write("(3) Como Jogar\n"),
  read(Choise), mainMenuSwitcher(Choise).

mainMenuSwitcher(1):- newGameMenu,!.
mainMenuSwitcher(2):- showPlacar,!.
mainMenuSwitcher(3):- tutorial,!.
mainMenuSwitcher(_):- errorHandler:error(0), mainMenu.


newGameMenu:-
  write("\n=========================\n"),
  write("[1] Player VS BOT \n"),
  write("[2] Player VS Player \n"),
  write("[3] Retornar ao menu principal\n"),
  write("Selecione uma opcao: \n"),
  read(Choise), newGameSwitcher(Choise).

newGameSwitcher(1):- playerXBot,!.
newGameSwitcher(2):- pvp:novoJogoPlayerXPlayer,!.
newGameSwitcher(3):- mainMenu,!.
newGameSwitcher(_):- errorHandler:error(0), newGameMenu.

showPlacar:-
  utils:cls,
  usersFields(listaUsuarios),
  write('|==================================|\n'),
  write('|     Nome       |    Pontuacao    |\n'),
  write('|==================================|\n'),
  printTable(users),
  write('|==================================|\n\n'),

  write('Pressione . para voltar ao menu principal...\n'),
  read(_), mainMenu.
  
tutorial:-
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
  read(Choise), mainMenu.

newGameHeader:-
  write('|================================================================|\n'),
  write('|==========================| NOVO JOGO |=========================|\n'),
  write('|================================================================|\n\n').

victoryGameHeader:-
  write('|=======================================================================================|\n'),
  write('|======================================| VICTORY! |=====================================|\n').

line:-
  write('|===================================================================================|\n').