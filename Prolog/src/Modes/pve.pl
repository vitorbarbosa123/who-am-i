:- module(pve, [
  novoJogoPlayerxBot/0,
  partidaPlayerxBot/5,
  vitoriaJogador/2,
  vitoriaBot/1
]).

:- use_module('./../Interfaces/menus.pl').
:- use_module('./../Interfaces/headers.pl').
:- use_module('./../Utils/utils.pl').
:- use_module('./../Utils/errorHandler.pl').
:- use_module('./../Data/repository.pl').

% Inicia um jogo de WaI
novoJogoPlayerxBot:-
    cls,
    newGameHeader,
    write('Digite o nome do Jogador: '),
    read(Username),

    (Username == "",
    errorHandler:error(4),
    novoJogoPlayerxBot);

    findOrCreateUser(Username, User),
    jogoPlayerxBot(User).

% Inicia o jogo de player contra bot
jogoPlayerxBot(Username):-
    PersonasField = listPersonas,
    Personas = map(parsePersonaToStringArray(PersonasField)),

    get(EscolhaJogador),
    IndiceJogador is (EscolhaJogador-1),
    nth0(IndiceJogador, Personas, PersonaJogador, _),

    random_between(0, 15, R),
    nth0(R, Personas, PersonaBot, _),

    PossibilidadesUser = map(parsePersonaToStringArray, PersonasField),
    PossibilidadesBot = map(parsePersonaToStringArray, PersonasField),

    partidaPlayerxBot(Username, PersonaJogador, PersonaBot, PossibilidadesUser, PossibilidadesBot).

% Inicia uma rodada de player contra bot
partidaPlayerxBot(Username,PersonaJogador,PersonaBot,PossibilidadesUser,PossibilidadesBot):-
    line,
    printTable(PossibilidadesUser),
    line,

    read(PalpiteJogador),
    NewPossibilidadesJogador = verificarPalpite(PalpiteJogador,PersonaBot,PossibilidadesUser),

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
    headers:line,
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
        utils:cls,
        partidaPlayerxBot(Username,PersonaJogador,PersonaBot,NewPossibilidadesJogador,NewPossibilidadesBot))
    ))
    ).


% Anuncia a vitória do jogador
vitoriaJogador(Username,PersonaBot):-
    incrementUserScore(Username),
    cls,
    victoryGameHeader,
    write('Você venceu!\n'),
    write('O personagem do bot era: '),
    write(PersonaBot),
    write('\n'),
    write('Pressione Enter para voltar ao menu principal...\n'),
    read(_),
    mainMenu.

% Anuncia a vitória do bot
vitoriaBot(PersonaBot):-
    cls,
    defeatGameHeader,
    write('Você perdeu!\n'),
    write('O personagem do bot era: '),
    write(PersonaBot),
    write('\n'),
    write('Pressione Enter para voltar ao menu principal...\n'),
    read(_),
    mainMenu.

