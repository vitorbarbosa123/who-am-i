:- module(pve, [
  novoJogoPlayerxBot/0
]).
/*
partidaPlayerxBot/5,
  vitoriaJogador/2,
  vitoriaBot/1
*/

:- use_module('./../Interfaces/menus.pl').
:- use_module('./../Interfaces/headers.pl').
:- use_module('./../Utils/utils.pl').
:- use_module('./../Utils/errorHandler.pl').
:- use_module('./../Data/repository.pl').

% Inicia um jogo de WaI
novoJogoPlayerxBot:-
    cls,
    connect_repo,
    newGameHeader,
    write('Digite o nome do Jogador: '),
    read_line_to_string(user_input, Username),

    (Username == "",
    errorHandler:error(4),
    novoJogoPlayerxBot);

    findOrCreateUser(Username, User),
    jogoPlayerxBot(Username).
 
% Inicia o jogo de player contra bot
jogoPlayerxBot(User):-
    cls,

    choosePersonaHeader,

    findPersonas(ListPersonas),
    formatTable(ListPersonas, 0),

    write("Digite o número do ID do seu personagem: \n"),
    read(Id),

    IndiceJogador is Id-1,
    nth0(IndiceJogador, ListPersonas, PersonaJogador),
   
    random_between(0, 15, R),
    nth0(R, ListPersonas, PersonaBot),
    
    line,

    write(PersonaBot),

    menuCharacteristics(Palpite),
  
    partidaPlayerxBot(User, Palpite, PersonaJogador, PersonaBot, ListPersonas).

verificarPalpite([], _, _, Aux, Result):- Result = Aux.

verificarPalpite([H|T], Palpite, PersonaBot, PalpitesCertos, Result):-
        member(Palpite, PersonaBot),
        (member(Palpite, H),
        append(PalpitesCertos, [H], Aux),
        verificarPalpite(T, Palpite, PersonaBot, Aux, Result),!;
        verificarPalpite(T, Palpite, PersonaBot, PalpitesCertos, Result)).
    
verificarPalpite([H|T], Palpite, PersonaBot, PalpitesCertos, Result):-
        member(Palpite, H),
        verificarPalpite(T, Palpite, PersonaBot, PalpitesCertos, Result),!;
        append(PalpitesCertos, [H], Aux),
        verificarPalpite(T, Palpite, PersonaBot, Aux, Result).

% Inicia uma rodada de player contra bot
partidaPlayerxBot(User, Palpite, PersonaJogador, PersonaBot, ListPersonas):-
    verificarPalpite(ListPersonas, Palpite, PersonaBot,[], Result),
    length(Result, R),
    (
    1 >= R -> vitoriaJogador(User, PersonaBot);
    cls,
    line,
    formatFilterTable(Result, 0),
    menuCharacteristics(NovoPalpite),
    partidaPlayerxBot(User, NovoPalpite, PersonaJogador, PersonaBot, Result)).
        

/*

    length(PossibilidadesUser, LengthPossibUser),
    length(NewPossibilidadesJogador, LengthPossibJog),

    (LengthPossibUser == LengthPossibJog,
    errorHandler:error(2),
    read(_),
    partidaPlayerxBot(Username, PersonaJogador, PersonaBot, PossibilidadesUser, PossibilidadesBot)
    );

    (
    (userGanhou(NewPossibilidadesJogador), vitoriaJogador(Username, PersonaBot));

    (PalpiteIA = pegarPalpiteIA(PossibilidadesBot),
    NewPossibilidadesBot = verificarPalpite(PalpiteIA, PersonaJogador, PossibilidadesBot),
    line,
    write('O Bot chutou a seguinte caracteristica: \n'),
    write('. '),
    sleep(5),
    write('.'),
    sleep(1),
    write('.'),
    sleep(1),
    write(PalpiteIA),
    sleep(3),
    (
        (userGanhou(NewPossibilidadesBot), vitoriaBot(PersonaBot));
        (
        cls,
        partidaPlayerxBot(Username,PersonaJogador,PersonaBot,NewPossibilidadesJogador,NewPossibilidadesBot))
    ))
    ).
*/
% Anuncia a vitória do jogador
vitoriaJogador(Username,PersonaBot):-
    /*incrementUserScore(Username),*/
    cls,
    victoryGameHeader,
    write('Você venceu!\n'),
    write('O personagem do bot era: '),
    write(PersonaBot),
    write('\n'),
    write('Digite qualquer valor para voltar ao menu principal...\n'),
    read(_),
    mainMenu.

/*
% Anuncia a vitória do bot
vitoriaBot(PersonaBot):-
    cls,
    defeatGameHeader,
    write('Você perdeu!\n'),
    write('O personagem do bot era: '),
    write(PersonaBot),
    write('\n'),
    write('Digite qualquer valor para voltar ao menu principal...\n'),
    read(_),
    mainMenu.
*/