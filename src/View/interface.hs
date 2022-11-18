--interface principal do "Who am i?"

menuPrincipal :: Int -> IO()
menuPrincipal = do
    putStr ("\n##############################\n")
    putStr ("Bem vindo ao 'Who am i?'!\n\n")
    putStr ("[1] Novo jogo\n")
    putStr ("[2] Como Jogar\n")
    putStr ("[3] Ranking\n")
    putStr ("[4] Sair\n\n")

    opcaoEscolhidaMP <- getLine

    if opcaoEscolhida == 1 then do 
        menuNovoJogo
        else if 
            opcaoEscolhida == 2 then 
                menuComoJogar
        else if 
            opcaoEscolhida == 3 then 
                menuRanking
        else if 
            opcaoEscolhida == 4 then 
                sairPrograma
        else do 
            putStr ("Opção inválida")
            menuPrincipal


-- Menu 1, novo jogo
menuNovoJogo :: int -> IO()
menuNovoJogo : do
    putStr ("[1] Novo perfil\n")
    putStr ("[2] Já possuo um perfil\n")
    putStr ("[3] Voltar ao menu principal\n\n")

    opcaoEscolhidaNJ <- getLine

    if opcaoEscolhidaNJ == 1 then do
        putStr ("Digite o nome de usuário a ser criado:\n")
        novoUsuario <- getLine
        -- TODO
        -- Implementar adição a base de usuários criados
        -- Após adicionar o usuário na base, inicia novo jogo (novoJogo)
        else if opcaoEscolhidaNJ == 2 then do
            novoJogo -- chamada a função novo jogo do wai.hs
        else if opcaoEscolhidaNJ == 3 then do
            menuPrincipal
        else
            putStr ("Opção inválida!")
            menuNovoJogo

    


-- Menu 2, como jogar
menuComoJogar :: Int -> IO()
menuComoJogar = do
    putStr ("“Who am i?” é um jogo de turnos, você escolhe um personagem e o Bot irá receber outro personagem aleatoriamente.\n")
    putStr ("A lista de personagens é mesma para ambos.\n" ++ "O objetivo do jogo é adivinhar o personagem do adversário, a cada rodada você pode:\n")
    putStr ("Questionar uma característica ou pode tentar chutar o personagem escolhido pelo Bot.\n" ++ "Para vencer, é necessário adivinhar o personagem primeiro do que o Bot.\n\n\n")
    putStr ("Informações importantes:\n" ++ "Você e o bot podem escolher o mesmo personagem.\nSe você escolher chutar e errar, você perde.\n\n")
    putStr ("[1] Retornar ao Menu Principal\n")

    opcaoEscolhidaMJ <- getLine

    if opcaoEscolhidaMJ == 1 then do 
        menuPrincipal
        else do 
            putStr("Opção inválida")
            menuComoJogar

-- Menu 3, ranking de jogadores
menuRanking :: Int -> IO()
menuRanking = do
    putStr ("Imprime aqui ranking dos top 10 jogadores cadastrados.\n\n") --Falta implementar

    putStr ("[1] Retornar ao menu Principal")
    opcaoEscolhidaMR <- getLine

    if opcaoEscolhida == 1 then do 
        menuPrincipal
        else do
            putStr ("Opção inválida")
            menuRanking

-- Menu 4 Sair do programa
sairPrograma :: Int -> IO()
sairPrograma = do
    putStr ("Tem certeza que deseja sair?\n")
    putStr ("[1] Sim")
    putStr ("[0] Não")

    opcaoEscolhidaSP <- getLine

    if opcaoEscolhidaSP == 1 then do 
        System.Exit(0)
        else if opcaoEscolhidaSP == 0 then
            menuPrincipal
        else do
            putStr ("Opção inválida")
            sairPrograma