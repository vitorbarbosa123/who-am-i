:- module(pve, [
  novoJogoPlayerxBot/0,
  partidaPlayerxBot/6,
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
    connect_repo,
    headers:newGameHeader,
    write('Digite o nome do Jogador: '),
    read(Username),
    findOrCreateUser(Username, User),

    findPersonas(X),
    write(X),

    get(EscolhaJogador),
    IndiceJogador is (EscolhaJogador-1),
    PersonaJogador = nth0(IndiceJogador,personas),

    N is random_between(0,15,R),
    PersonaBot = nth0(N,personas),

    PossibilidadesUser = map(parsePersonaToStringArray,personasField),
    PossibilidadesBot = map(parsePersonaToStringArray,personasField),

    partidaPlayerxBot(Username,PersonaJogador,PersonaBot,PossibilidadesUser,PossibilidadesBot).


% Inicia uma partida de WaI
partidaPlayerxBot(Username,PersonaJogador,PersonaBot,PossibilidadesUser,PossibilidadesBot,V):-
    headers:line,
    printTable(PossibilidadesUser),
    headers:line,

    read(PalpiteJogador),
    newPossibilidadesJogador = verificarPalpite(PalpiteJogador,PersonaBot,PossibilidadesUser),

    ((length(PossibilidadesUser) is length(newPossibilidadesJogador)) -> errorHandler:error(2),
    read(_),
    partidaPlayerxBot(Username,PersonaJogador,PersonaBot,PossibilidadesUser,PossibilidadesBot);

    (userGanhou(newPossibilidadesJogador) = True -> vitoriaJogador(Username,PersonaBot);
    PalpiteIA = pegarPalpiteIA(PossibilidadesBot),
    newPossibilidadesBot = verificarPalpite(PalpiteIA,PersonaJogador,PossibilidadesBot),
    headers:line,
    write('O Bot chutou a seguinte caracteristica: \n'),
    write('.'),
    sleep(0.1),
    write('.'),
    sleep(0.1),
    write('.'),
    sleep(0.1),
    write(PalpiteIA),
    sleep(0.3),
    ((userGanhou(newPossibilidadesBot) -> vitoriaBot(PersonaBot));
    utils:cls,
    partidaPlayerxBot(Username,PersonaJogador,PersonaBot,newPossibilidadesJogador,newPossibilidadesBot)
    ))).


% Anuncia a vitória do jogador
vitoriaJogador(Username,PersonaBot):-
    incrementUserScore(Username),
    utils:cls,
    menus:victoryGameHeader,
    write('Você venceu!\n'),
    write('O personagem do bot era: '),
    write(PersonaBot),
    write('\n'),
    write('Pressione Enter para voltar ao menu principal...\n'),
    read(_),
    menuPrincipal.

% Anuncia a vitória do bot
vitoriaBot(PersonaBot):-
    utils:cls,
    menus:defeatGameHeader,
    write('Você perdeu!\n'),
    write('O personagem do bot era: '),
    write(PersonaBot),
    write('\n'),
    write('Pressione Enter para voltar ao menu principal...\n'),
    read(_),
    menuPrincipal.

