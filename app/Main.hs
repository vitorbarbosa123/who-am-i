module Main where

import System.Random
import Repo.Usuarios
import Repo.Personas



main :: IO ()
main = do
    escolha <- pegaEscolhaInicial
    if escolha == "1" then
        menunovoJogoGeral
    else if escolha == "2" then
        showPlacar
    else if escolha == "3" then
        menuComoJogar
    else do
        putStr ("Opcao inválida!\n")
        main


pegaEscolhaInicial :: IO String
pegaEscolhaInicial = do
    cls
    putStr "\n=========================\n"
    putStr "Bem vindo ao `Who Am I?`!\n"
    putStr "=========================\n"
    putStr "O que voce deseja fazer?\n"
    putStr "(1) Iniciar novo jogo\n"
    putStr "(2) Listar pontuacoes\n"
    putStr "(3) Como Jogar\n"
    getLine


menunovoJogoGeral :: IO()
menunovoJogoGeral = do
    putStr "\n=========================\n"
    putStr "[1] Player VS BOT \n"
    putStr "[2] Player VS Player \n"
    putStr "[3] Retornar ao menu principal\n"
    putStr "Selecione uma opcao: \n"
    escolhaJG <- getLine
    
    if escolhaJG == "1" then
        novoJogoPlayerXBot
        else if escolhaJG == "2" then
            novoJogoPlayerXPlayer
        else if escolhaJG == "3" then
            pegaEscolhaInicial
        else do
            putStr ("Opcao inválida!\n")
            menunovoJogoGeral


--Imprime o placar de pontuacao, dos usuarios do banco
showPlacar :: IO ()
showPlacar = do
    cls
    usersFields <- listaUsuarios
    let users = map parseUserToStringArray usersFields
    putStr "|==================================|\n"
    putStr "     nome       |    pontuacao      \n"
    putStr "|==================================|\n"
    printTable users
    putStr "|==================================|\n\n"

    putStr "Pressione Enter para voltar ao menu principal...\n"
    getLine

    main


-- Imprime apenas orientacoes da regra geral de negocio. -- ToDo: Ajustar as regras de acordo com o projeto atual!
menuComoJogar :: IO()
menuComoJogar = do
    putStr ("\n==============================================\n")
    putStr ("Who am i? eh um jogo de turnos, você escolhe um personagem e o Bot ira receber outro personagem aleatoriamente. Onde a lista de personagens eh a mesma para ambos.\n\n")
    putStr ("O objetivo do jogo eh adivinhar o personagem do adversario, a cada rodada voce pode:\n")
    putStr (". Eliminar uma caracteristica\n")
    putStr (". Tentar chutar o personagem do Bot.\n\n")
    putStr ("Para vencer, eh necessario adivinhar o personagem primeiro do que o Bot.\n\n")
    putStr ("Informacoes importantes:\n")
    putStr ("Voce e o bot podem escolher o mesmo personagem.\n")
    putStr ("Se voce escolher chutar e errar, voce perde a rodada.\n\n")


    putStr ("[1] Retornar ao menu principal\n")
    putStr("Digite uma opcao: ")
    opcaoEscolhidaCJ <- getLine

    if opcaoEscolhidaCJ == "1" then do
        main
        else do
            putStr ("Opcao invalida! \n")
            menuComoJogar 

---------------
--PlayerxPlayer:
----------------
novoJogoPlayerXPlayer :: IO ()
novoJogoPlayerXPlayer = do
    cls
    putStr "|================================================================|\n"
    putStr "|==========================| NOVO JOGO |=========================|\n"
    putStr "|================================================================|\n\n"

    print "Digite o nome do jogador 1"
    username1 <- getLine

    print "Digite o nome do jogador 2"
    username2 <- getLine

    if username1 == username2 then do
        putStr "ERRO: Nomes nao podem ser iguais. Pressione Enter para continuar...\n"
        getLine
        novoJogoPlayerXPlayer
    else do
        userField <- criaUsuarioSeNaoExistir username1
        let user1 = parseUserToStringArray (head userField)

        userField <- criaUsuarioSeNaoExistir username2
        let user2 = parseUserToStringArray (head userField)

        jogoPxP user1 user2

        main


jogoPxP :: [String] -> [String] -> IO()
jogoPxP user1 user2 = do
    personasField <- listPersonas
    let personas = map parsePersonaToStringArray personasField

    escolha <- escolhePersonagem user1 personas
    let index = (read escolha :: Int) -1
    let personaUser = personas!!index

    escolha <- escolhePersonagem user2 personas
    let index = (read escolha :: Int) -1
    let personaUser2 = personas!!index

    let possibilidadesUser = map parsePersonaToStringArray personasField
    let possibilidadesUser2 = map parsePersonaToStringArray personasField

    partidaPxP user1 user2 personaUser personaUser2 possibilidadesUser possibilidadesUser2

    main


partidaPxP :: [String] -> [String] -> [String] -> [String] -> [[String]] -> [[String]] -> IO()
partidaPxP jogadorDaVez oponente personaJogadorDaVez personaOponente possibilidadesJogadorDaVez possibilidadesOponente = do
    if userGanhou possibilidadesOponente then do
        vitoria oponente jogadorDaVez personaJogadorDaVez
    else do
        cls
        putStr "|===================================================================================|\n"
        printTable possibilidadesJogadorDaVez
        putStr "|===================================================================================|\n\n"

        palpite <- pegarPalpiteUser jogadorDaVez
        let newPossibilidades = verificarPalpite palpite personaOponente possibilidadesJogadorDaVez
        if length newPossibilidades == length possibilidadesJogadorDaVez then do
            putStr "OPCAO INVALIDA! Pressione Enter para tentar novamente...\n"
            getLine
            partida jogadorDaVez oponente personaJogadorDaVez personaOponente possibilidadesJogadorDaVez possibilidadesOponente
        else
            partida oponente jogadorDaVez personaOponente personaJogadorDaVez possibilidadesOponente newPossibilidades


vitoria :: [String] -> [String] -> [String] -> IO()
vitoria userGanhador oponente personaOponente = do
    somaPontosUsuario (head userGanhador) 1

    cls
    putStr "|=======================================================================================|\n"
    putStr "|======================================| VICTORY! |=====================================|\n"
    putStr "|=======================================================================================|\n\n"
    putStr ("PARABENS " ++ head userGanhador ++ "! VOCE GANHOU!\n")
    putStr ("O personagem de " ++ head oponente ++ " era: " ++ prepareTableLine personaOponente ++ "\n")
    putStr "Pressione Enter para voltar ao menu principal...\n"
    getLine
    putStr ""

---------------
--PlayerxBot:
----------------
novoJogoPlayerXBot :: IO ()
novoJogoPlayerXBot = do
    cls
    putStr "|================================================================|\n"
    putStr "|==========================| NOVO JOGO |=========================|\n"
    putStr "|================================================================|\n\n"

    print "Digite o nome do jogador "
    username1 <- getLine

    if username1 == "" then do
        putStr "ERRO: É necessário digitar um nome de usuário, aperte ENTER para continuar \n"
        getLine
        novoJogoPlayerXBot
    else do
        userField <- criaUsuarioSeNaoExistir username1
        let user1 = parseUserToStringArray (head userField)

        jogoPxB user1 

        main


jogoPxB :: [String] -> IO()
jogoPxB user1 = do
    personasField <- listPersonas
    let personas = map parsePersonaToStringArray personasField

    escolha <- escolhePersonagem user1 personas
    let index = (read escolha :: Int) -1
    let personaUser = personas!!index

    --Gera um numero randomico, que definirá o personagem do bot
    indexBot <- randomIO :: IO Int
    let index = indexBot `mod` (length personas)       
    let personaBot = personas!!index

    let possibilidadesUser = map parsePersonaToStringArray personasField
    let possibilidadesBot = map parsePersonaToStringArray personasField

    partidaPxB user1 personaUser personaBot possibilidadesUser possibilidadesBot

    main


partidaPxB :: [String] -> [String] -> [String] -> [[String]] -> [[String]] -> IO()
partidaPxB jogador personaJogador personaBot possibilidadesJogador possibilidadesBot = do
    if userGanhou possibilidadesBot then do
        vitoriaBot personaBot
    else if userGanhou possibilidadesJogador then do
        vitoriaJogador jogador personaBot
    else do
        cls
        putStr "|===================================================================================|\n"
        printTable possibilidadesJogador
        putStr "|===================================================================================|\n\n"

        palpite <- pegarPalpiteUser jogador
        let newPossibilidadesJogador = verificarPalpite palpite personaBot possibilidadesJogador
        if length newPossibilidadesJogador == length possibilidadesJogador then do
            putStr "OPCAO INVALIDA! Pressione Enter para tentar novamente...\n"
            getLine
            partidaPxB jogador personaJogador personaBot possibilidadesJogador possibilidadesBot
        else
            palpiteIa <- pegarPalpiteIA possibilidadesBot
            let newPossibilidadesBot = verificarPalpite palpiteIa personaJogador possibilidadesBot
            partidaPxB jogador personaJogador personaBot newPossibilidadesJogador newPossibilidadesBot

vitoriaJogador :: [String] -> [String] -> IO()
vitoriaJogador jogador personaBot = do
    somaPontosUsuario (head jogador) 1

    cls
    putStr "|=======================================================================================|\n"
    putStr "|======================================| VICTORY! |=====================================|\n"
    putStr "|=======================================================================================|\n\n"
    putStr ("Você venceu!\n")
    putStr ("O personagem do bot era: " ++ prepareTableLine personaBot ++ "\n")
    putStr "Pressione Enter para voltar ao menu principal...\n"
    getLine
    putStr ""


vitoriaBot :: [String] -> IO()
vitoriaBot personaBot = do
    cls
    putStr "|=======================================================================================|\n"
    putStr "|======================================| DEFEAT! |=====================================|\n"
    putStr "|=======================================================================================|\n\n"
    putStr ("Você PERDEU!\n")
    putStr ("O personagem do bot era: " ++ prepareTableLine personaBot ++ "\n")
    putStr "Pressione Enter para voltar ao menu principal...\n"
    getLine
    putStr ""

---------------
--Logic:
----------------
escolhePersonagem :: [String] -> [[String]] -> IO String
escolhePersonagem user personas = do
    cls
    putStr "|===================================================================================|\n"
    putStr "|=============================| ESCOLHA SEU PERSONAGEM |============================|\n"
    putStr "|===================================================================================|\n"
    printTable personas
    putStr "\n"
    putStr ("Escolha um personagem, " ++ user!!0 ++ ":\n")

    getLine


userGanhou :: [[String]] -> Bool
userGanhou listaPossibilidades = length listaPossibilidades <= 1


pegarPalpiteUser :: [String] -> IO String
pegarPalpiteUser user = do
    putStr ("Qual caracteristica voce deseja escolher " ++ head user ++ "?\n")
    putStr "[0] sexo | [1] cor do cabelo | [2] etnia | [3] cor dos olhos | [4] acessorio\n"
    caracteristica <- getLine

    if caracteristica == "0" then do
        putStr "Qual o sexo?\n"
        getLine
    else if caracteristica == "1" then do
        putStr "Qual a cor do cabelo?\n"
        getLine
    else if caracteristica == "2" then do
        putStr "Qual a etnia?\n"
        getLine
    else if caracteristica == "3" then do
        putStr "Qual a cor dos olhos?\n"
        getLine
    else if caracteristica == "4" then do
        putStr "Qual o acessorio?\n"
        getLine
    else do
        putStr "OPCAO INVALIDA!\n"
        pegarPalpiteUser user


verificarPalpite :: String -> [String] -> [[String]] -> [[String]]
verificarPalpite palpite persona possibilidades = do
    if palpite `elem` persona then
        [personagem | personagem <- possibilidades, palpite `elem` personagem]
    else
        [personagem | personagem <- possibilidades, palpite `notElem` personagem]


printTable :: [[String]] -> IO()
printTable = mapM_ (putStr . prepareTableLine)


prepareTableLine :: [String] -> String
prepareTableLine [] = ""
prepareTableLine [head] = head ++ "\n"
prepareTableLine (head:users) = "   " ++ head ++ "  |  " ++ prepareTableLine users


-------------------------
--Algoritmo da IA abaixo:
-------------------------
renderRandom::[a] -> IO Int
renderRandom array =
   randomRIO (0, length array - 1)


getElemByIndex :: [a] -> IO a
getElemByIndex list = do
    index <- renderRandom list
    return $ list!!index


pegarPalpiteIA :: [[String]] -> IO String
pegarPalpiteIA possibilidades = do
    p <- getElemByIndex possibilidades
    getElemByIndex (tail (tail p))


--Função para limpar o terminal.
cls :: IO()
cls = putStr "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\"