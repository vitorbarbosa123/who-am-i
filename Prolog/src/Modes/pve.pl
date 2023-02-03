/* <module> pve
*  Módulo respectivo ao modo de jogo: Jogador Vs Bot
*/
:- module(pve, [
  novoJogoPlayerxBot/0
]).

:- use_module('./../Interfaces/menus.pl').
:- use_module('./../Interfaces/headers.pl').
:- use_module('./../Utils/utils.pl').
:- use_module('./../Utils/errorHandler.pl').
:- use_module('./../Utils/helpers.pl').
:- use_module('./../Data/repository.pl').
:- use_module('./../Model/model.pl').

% Inicia um jogo de WaI
novoJogoPlayerxBot:-
    connect_repo,
    cls,
    newGameHeader,
    write('Digite o nome do Jogador: '),
    read(Username),

    (Username == "",
    errorHandler:error(4),
    novoJogoPlayerxBot);
    findOrCreateUser(Username, User),
    jogoPlayerxBot(Username).
 
/*
*  Inicia o jogo de player contra bot
    @param User, Usuário criado ou recuperado do banco de dados
*/ 
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

    menuCharacteristics(Palpite),
  
    partidaPlayerxBot(User, Palpite, PersonaJogador, PersonaBot, ListPersonas, ListPersonas).




/*
* Inicia uma rodada de player contra bot
* @param User, jogador
  @param Palpite, palpite dado pelo jogador
  @param PersonaJogador, personagem escolhido pelo jogador
  @param PersonaBot, personagem escolhido pelo bot
  @param ListPersonas, lista com todos os personagens possíveis
*/ 
partidaPlayerxBot(User, Palpite, PersonaJogador, PersonaBot, ListPersonasJogador, ListPersonasBot):-
    cls,
    verificarPalpite(ListPersonasJogador, Palpite, PersonaBot,[], Result),
    writeln("Filtrando escolha..."),
    sleep(3),
    writeln("Personagens restantes para Jogador"),
    line,
    formatFilterTable(Result, 0),
    length(Result, R),
    (
    1 >= R -> vitoriaJogador(User, PersonaBot);

    pegarPalpiteIA(PalpiteIA),
    write('O Bot chutou a seguinte caracteristica: '), writeln(PalpiteIA),
    sleep(3),
      
    verificarPalpite(ListPersonasBot, PalpiteIA ,PersonaJogador, [], NewResult),
    writeln("Personagens restantes para Bot"),

    line,
    formatFilterTable(NewResult, 0),
    length(NewResult, R1),   
    (
    1 >= R1 -> vitoriaBot(PersonaBot);
    menuCharacteristics(NovoPalpite),
    partidaPlayerxBot(User, NovoPalpite, PersonaJogador, PersonaBot, Result, NewResult)
    )
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
