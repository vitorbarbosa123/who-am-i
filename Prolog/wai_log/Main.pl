% Função principal, inicia o WaI?
main:-
read(EscolhaMenuPrincipal),
read_line_to_string(EscolhaMenuPrincipal),

((EscolhaMenuPrincipal = '1') -> menuNovoJogoGeral;
(EscolhaMenuPrincipal = '2') -> showPlacar;
(EscolhaMenuPrincipal = '3') -> menuComoJogar;
(EscolhaMenuPrincipal = _) -> main).

% Imprime as opções do menu
menuPrincipal:-
write('\n=========================\n'),
write('Bem vindo ao `Who Am I?`!\n'),
write('=========================\n'),
write('O que voce deseja fazer?\n'),
write('(1) Iniciar novo jogo\n'),
write('(2) Listar pontuacoes\n'),
write('(3) Como Jogar\n'),
main.

% Menu (1) Iniciar novo jogo
menuNovoJogoGeral:-
write('\n=========================\n'),
write('[1] Player VS BOT \n'),
write('[2] Player VS Player \n'),
write('[3] Retornar ao menu principal\n'),
write('Selecione uma opcao: \n'),
read(EscolhaNovoJogo),

((EscolhaNovoJogo = '1') -> novoJogoPlayerXBot;
(EscolhaNovoJogo = '2') -> novoJogoPlayerXPlayer;
(EscolhaNovoJogo = '3') -> menuPrincipal;
write('Opcao Invalida!\n'), menuNovoJogoGeral)

% Menu (2) Lista o placar de usuarios, salvo pelo banco de dados
showPlacar:-
cls,
usersFields(listaUsuarios),
write('|==================================|\n'),
write('|     Nome       |    Pontuacao    |\n'),
write('|==================================|\n'),
printTable(users),
write('|==================================|\n\n'),

write('Pressione Enter para voltar ao menu principal...\n'),
read(_),
menuPrincipal.

% Menu (3) Imprime as regras do jogo
menuComoJogar:-
write('\n==============================================\n'),
write('Who am I? eh um jogo em turnos, no qual você escolhe um personagem e o Bot ira escolher outro personagem aleatoriamente. Os personagens são iguais para ambos.\n\n'),
write('O objetivo do jogo é adivinhar o personagem escolhido pelo adversário. '),
write('A cada rodada, cada participante escolhe uma característica a ser filtrada entre os personagens existentes.\n'),
write('Para vencer, o jogador precisa adivinhar o personagem escolhido pelo bot antes que este descubra o seu.'),
write('Modos de jogo:\n'),
write('Jogador X Jogador\n'),
write('Jogador X IA\n\n'),
write('Informações importantes:\n'),
write('É possível que o bot escolha o mesmo personagem que o jogador.'),
write('Ao chutar a identidade de um personagem, a rodada é encerrada; o ponto vai para o realizador do chute, caso acerte, ou para o adversário em caso de erro.\n\n'),
write('Pressione qualquer tecla para voltar ao menu principal.'),
read(_),
menuPrincipal.

% Inicia um novo jogo contra um bot. Usuário seleciona o nome de jogador a ser utilizado
novoJogoPlayerXBot:-
cls,
write('|================================================================|\n'),
write('|==========================| NOVO JOGO |=========================|\n'),
write('|================================================================|\n\n'),

write('Digite o nome do jogador: '),
read(NomeJogador),

((NomeJogador = '') -> write('ERRO: É necessário digitar um nome de usuário, aperte ENTER para continuar'),
read(_),novoJogoPlayerXBot;
userField(criaUsuarioSeNaoExistir(NomeJogador)),
user = read_line_to_string(head NomeJogador),
jogoPxB(NomeJogador),

menuPrincipal).

% Inicia um jogo de WaI
jogoPxB(NomeJogador,V):-
personasField(listPersonas),
personas = map(parsePersonaToStringArray,personasField),

get(EscolhaJogador),
IndiceJogador is (EscolhaJogador-1),
PersonaJogador = nth0(IndiceJogador,personas),

N is random_between(0,15,R),
PersonaBot = nth0(N,personas),

PossibilidadesUser = map(parsePersonaToStringArray,personasField),
PossibilidadesBot = map(parsePersonaToStringArray,personasField),

partidaPxB(NomeJogador,PersonaJogador,PersonaBot,PossibilidadesUser,PossibilidadesBot)

menuPrincipal.

% Inicia uma partida de WaI
partidaPxB(NomeJogador,PersonaJogador,PersonaBot,PossibilidadesUser,PossibilidadesBot,V):-
write('|===================================================================================|\n'),
printTable(PossibilidadesUser),
write('|===================================================================================|\n\n'),

read(PalpiteJogador),
newPossibilidadesJogador = verificarPalpite(PalpiteJogador,PersonaBot,PossibilidadesUser),

((length(PossibilidadesUser) is length(newPossibilidadesJogador)) -> write('OPCAO INVALIDA! Pressione Enter para tentar novamente...\n'),
read(_),
partidaPxB(NomeJogador,PersonaJogador,PersonaBot,PossibilidadesUser,PossibilidadesBot);

(userGanhou(newPossibilidadesJogador) = True -> vitoriaJogador(NomeJogador,PersonaBot);
PalpiteIA = pegarPalpiteIA(PossibilidadesBot),
newPossibilidadesBot = verificarPalpite(PalpiteIA,PersonaJogador,PossibilidadesBot),
write('|===================================================================================|\n'),
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
cls,
partidaPxB(NomeJogador,PersonaJogador,PersonaBot,newPossibilidadesJogador,newPossibilidadesBot)
))).

% Anuncia a vitória do jogador
vitoriaJogador(NomeJogador,PersonaBot):-
somaPontosUsuario(NomeJogador)
cls,
write('|=======================================================================================|\n'),
write('|======================================| VICTORY! |=====================================|\n'),
write('|=======================================================================================|\n\n'),
write('Você venceu!\n'),
write('O personagem do bot era: '),
write(PersonaBot),
write('\n'),
write('Pressione Enter para voltar ao menu principal...\n'),
read(_),
menuPrincipal.

% Anuncia a vitória do bot
vitoriaBot(PersonaBot):-
cls,
write('|=======================================================================================|\n'),
write('|======================================| DEFEAT ! |=====================================|\n'),
write('|=======================================================================================|\n\n'),
write('Você perdeu!\n'),
write('O personagem do bot era: '),
write(PersonaBot),
write('\n'),
write('Pressione Enter para voltar ao menu principal...\n'),
read(_),
menuPrincipal.

% Limpa o terminal
cls :- write('\33\[2J').