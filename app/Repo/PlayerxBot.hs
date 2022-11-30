module Repo.PlayerxBot where

import System.Random
import Repo.Logic
import Repo.Usuarios
import Repo.Personas
import Main

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