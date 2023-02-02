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
    read(Username),

    (Username == "",
    errorHandler:error(4),
    novoJogoPlayerxBot);

    findOrCreateUser(Username, User),
    jogoPlayerxBot(User).
 
% Inicia o jogo de player contra bot
jogoPlayerxBot(User):-
    cls,

    choosePersonaHeader,

    findPersonas(X),
    formatTable(X, 0),

    write("Digite o número do ID do seu personagem: \n"),
    read(Id),

    IndiceJogador is Id-1,
    nth0(IndiceJogador, X, PersonaJogador),
   
    random_between(0, 15, R),
    nth0(R, X, PersonaBot),
    
    line,

    menuCharacteristics(EscolhaJogador),

    PossibilidadesUser = X,
    PossibilidadesBot = X,

    partidaPlayerxBot(User, PersonaJogador, PersonaBot, PossibilidadesUser, PossibilidadesBot).

inserir_final([], Y, [Y]).
inserir_final([I|R], Y, [I|R1]) :- inserir_final(R, Y, R1).

verificarPalpite(Index, Palpite, Persona, Possibilidades, PalpitesCertos):-
    (
        member(Palpite, Persona),
        nth0(Index, Possibilidades, Personagem, Tail),

        member(Palpite, Personagem),
        (
            length(PalpitesCertos, L),
            (
                L =:= 0,
                inserir_final([], Personagem, Lista)
            );
            inserir_final(PalpitesCertos, Personagem, Lista)
        )
    );
    I is Index+1,
    I < 15,
    verificarPalpite(I, Palpite, Persona, Possibilidades, Lista),
    write(PalpitesCertos),
    PalpitesCertos = Lista.
 

% Inicia uma rodada de player contra bot
partidaPlayerxBot(Username,PersonaJogador,PersonaBot,PossibilidadesUser,PossibilidadesBot):-
    line,
    findPersonas(X),
    formatTable(X, 0),
    line,

    read(EscolhaJogador),
    verificarPalpite(0, EscolhaJogador,PersonaBot,PossibilidadesUser, NewPossibilidadesJogador),
    write(NewPossibilidadesJogador).

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

% Anuncia a vitória do jogador
vitoriaJogador(Username,PersonaBot):-
    incrementUserScore(Username),
    cls,
    victoryGameHeader,
    write('Você venceu!\n'),
    write('O personagem do bot era: '),
    write(PersonaBot),
    write('\n'),
    write('Digite qualquer valor para voltar ao menu principal...\n'),
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
    write('Digite qualquer valor para voltar ao menu principal...\n'),
    read(_),
    mainMenu.
*/