--interface principal do "Who am i?"

-- Menu principal que irá interagir com o usuário
-- O mesmo precisa selecionar opções entre 1 a 4, sendo a opção 1 de iniciar um novo jogo.
menuPrincipal :: IO()
menuPrincipal = do
    putStr ("\n==============================================\n")
    putStr ("Bem vindo ao 'Who am i?'!\n\n")
    putStr ("[1] Novo jogo\n")
    putStr ("[2] Como Jogar\n")
    putStr ("[3] Ranking\n")
    putStr ("[4] Sair\n\n")

    putStr("Digite uma opcao: ")
    opcaoEscolhidaMP <- getLine

    if opcaoEscolhidaMP == "1" then do 
        menuNovoJogo
        else if 
            opcaoEscolhidaMP == "2" then 
                menuComoJogar
        else if 
            opcaoEscolhidaMP == "3" then 
                menuRanking
        else if 
            opcaoEscolhidaMP == "4" then 
                sairPrograma
        else do 
            putStr ("Opção invalida\n")
            menuPrincipal --para que o programa não termine, e retorne ao mesmo menu.



-- Menu 1, novo jogo
-- Função mais importante, irá popular o savefile de usuários já cadastrados e
-- irá iniciar novo jogo, nas regras de negócio
menuNovoJogo :: IO()
menuNovoJogo = do
    putStr ("\n==============================================\n")
    putStr ("[1] Comecar novo jogo\n")
    putStr ("[2] Voltar ao menu principal\n\n")

    putStr("Digite uma opcao: ")
    opcaoEscolhidaNJ <- getLine

    if opcaoEscolhidaNJ == "1" then do
        putStr("Insira seu nome de usuário: ")
        nome <- getLine -- verificar se, já existe o usuário. Se existir, a pontuacao da partida será somada, do contrário, novo usuário precisa ser criado
        putStr("novoJogo") -- chamada a funcao do main.hs, iniciando novo jogo e suas respectivas partidas
        else if opcaoEscolhidaNJ == "2" then
            menuPrincipal
        else do
            putStr ("Opção Invalida \n")
            menuNovoJogo --para que o programa não termine, e retorne ao mesmo menu.



-- Menu 2, como jogar
-- Imprime apenas orientações da regra geral de negócio.
menuComoJogar :: IO()
menuComoJogar = do
    putStr ("\n==============================================\n")
    putStr ("“Who am i?” é um jogo de turnos, você escolhe um personagem e o Bot irá receber outro personagem aleatoriamente.\n")
    putStr ("A lista de personagens é mesma para ambos.\nO objetivo do jogo é adivinhar o personagem do adversário, a cada rodada você pode:\n")
    putStr ("Questionar uma característica ou pode tentar chutar o personagem escolhido pelo Bot.\nPara vencer, é necessário adivinhar o personagem primeiro do que o Bot.\n\n\n")
    putStr ("Informações importantes:\nVocê e o bot podem escolher o mesmo personagem.\nSe você escolher chutar e errar, você perde.\n\n")
    putStr ("[1] Retornar ao Menu Principal\n")

    putStr("Digite uma opcao: ")
    opcaoEscolhidaCJ <- getLine

    if opcaoEscolhidaCJ == "1" then do 
        menuPrincipal
        else do 
            putStr("Opção invalida \n")
            menuComoJogar --para que o programa não termine, e retorne ao mesmo menu.



-- Menu 3, ranking de jogadores
-- imprime o save file, ordenado, dos usuários cadastrados. -> USUARIO, Vitorias: X
menuRanking :: IO()
menuRanking = do
    putStr ("\n==============================================\n")
    putStr ("Imprime aqui ranking dos top 10 jogadores cadastrados.\n\n") --Falta implementar
    
    putStr ("[1] Retornar ao menu Principal\n")
    putStr("Digite uma opcao: ")
    opcaoEscolhidaMR <- getLine

    if opcaoEscolhidaMR == "1" then do 
        menuPrincipal
        else do
            putStr ("Opção invalida \n")
            menuRanking --para que o programa não termine, e retorne ao mesmo menu.



-- Menu 4 Sair do programa
-- encerra a execucao do programa na opção 1, retorna ao menu principal na posicao 0
sairPrograma :: IO()
sairPrograma = do
    putStr ("\n==============================================\n")
    putStr ("Tem certeza que deseja sair?\n")
    putStr ("[1] Sim\n")
    putStr ("[2] Não\n\n")

    putStr("Digite uma opcao: ")
    opcaoEscolhidaSP <- getLine

    if opcaoEscolhidaSP == "1" then do 
        putStr("System.Exit(0)")
        else if opcaoEscolhidaSP == "2" then
            menuPrincipal
        else do
            putStr ("Opção invalida \n")
            sairPrograma --para que o programa não termine, e retorne ao mesmo menu.