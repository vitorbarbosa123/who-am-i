/* <module> headers
*  Módulo contento os displays que são usados pela aplicação  
*/
:- module(headers, [
  line/0,
  newGameHeader/0,
  victoryGameHeader/0,
  defeatGameHeader/0,
  choosePersonaHeader/0
]).

line:-
  write('|=======================================================================================|\n').

newGameHeader:-
  write('|=======================================================================================|\n'),
  write('|======================================| NOVO JOGO! |===================================|\n'),  
  write('|=======================================================================================|\n').

victoryGameHeader:-
  write('|=======================================================================================|\n'),
  write('|======================================| VICTORY! |=====================================|\n'),
  write('|=======================================================================================|\n').

defeatGameHeader:-
  write('|=======================================================================================|\n'),
  write('|======================================| DEFEAT ! |=====================================|\n'),
  write('|=======================================================================================|\n').


choosePersonaHeader:-
  write('|=======================================================================================|\n'),
  write('|=============================| ESCOLHA SEU PERSONAGEM |================================|\n'),
  write('|=======================================================================================|\n').
