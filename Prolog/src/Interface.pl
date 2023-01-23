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
mainMenuSwitcher(2):- scoreboard,!.
mainMenuSwitcher(3):- tutorial,!.
mainMenuSwitcher(_):- write('Opção inválida!'), mainMenu.



newGameMenu:-
  write("\n=========================\n"),
  write("[1] Player VS BOT \n"),
  write("[2] Player VS Player \n"),
  write("[3] Retornar ao menu principal\n"),
  write("Selecione uma opcao: \n"),
  read(Choise), newGameSwitcher(Choise).

newGameSwitcher(1):- playerXBot,!.
newGameSwitcher(2):- playerXplayer,!.
newGameSwitcher(3):- mainMenu,!.
newGameSwitcher(_):- write('Opção inválida!'), newGameMenu.

