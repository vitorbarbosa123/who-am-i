module Main where

import System.Random
import Repo.Usuarios
import Repo.Personas

novoJogo :: IO ()
novoJogo = do
    print "Digite um nome de usuario"
    username <- getLine
    userField <- criaUsuarioSeNaoExistir username
    let user = parseUserToStringArray (userField!!0)

    jogo user

    main

jogo :: [String] -> IO()
jogo user = do
    personasField <- listPersonas
    let personas = map parsePersonaToStringArray personasField

    print "Escolha um personagem: "
    printTable personas

    escolha <- getLine
    let index = (read escolha :: Int) -1
    let personaUsuario = personas!!index

    indexIA <- randomIO :: IO Int
    let index = indexIA `mod` (length personas)
    let personaIA = personas!!index

    let possibilidadesUser = map parsePersonaToStringArray personasField
    let possibilidadesIA = map parsePersonaToStringArray personasField

    print personaIA

    partida user personaUsuario personaIA possibilidadesUser possibilidadesIA "user"

    main

pegarPalpiteUser :: IO String
pegarPalpiteUser = do
    print "Qual caracteristica voce deseja escolher?"
    print "sexo | cor_cabelo | etnia | cor_olhos | acessorio"
    caracteristica <- getLine

    if(caracteristica == "sexo") then do
        print "Qual o sexo?"
        getLine
    else if(caracteristica == "cor_cabelo") then do
        print "Qual a cor do cabelo?"
        getLine
    else if(caracteristica == "etnia") then do
        print "Qual a etnia?"
        getLine
    else if(caracteristica == "cor_olhos") then do
        print "Qual a cor dos olhos?"
        getLine
    else if(caracteristica == "acessorio") then do
        print "Qual o acessorio?"
        getLine
    else 
        pegarPalpiteUser
        
partida :: [String] -> [String] -> [String] -> [[String]] -> [[String]] -> String -> IO()
partida user personaUsuario personaIA possibilidadesUser possibilidadesIA jogadorDaVez = do
    if((length possibilidadesUser) <= 1) then do
        somaPontosUsuario (user!!0) 1
        print "parabens! voce ganhou!"
    else if((length possibilidadesIA) <= 1) then
        print "sinto muito... voce perdeu."
    else
        if(jogadorDaVez == "user") then do
            printTable possibilidadesUser
            palpite <- pegarPalpiteUser
            let newPossibilidades = verificarPalpite palpite personaIA possibilidadesUser
            partida user personaUsuario personaIA newPossibilidades possibilidadesIA "ia"
        else do
            -- palpite <- pegarPalpiteUser
            -- let newPossibilidades = verificarPalpite palpite personaUsuario possibilidadesIA
            let newPossibilidades = tail possibilidadesIA
            partida user personaUsuario personaIA possibilidadesUser newPossibilidades "user"

verificarPalpite :: String -> [String] -> [[String]] -> [[String]]
verificarPalpite palpite persona possibilidades = do
    if(elem palpite persona) then
        [personagem | personagem <- possibilidades, elem palpite personagem]
    else
        [personagem | personagem <- possibilidades, not (elem palpite personagem)]

showPlacar :: IO ()
showPlacar = do
    usersFields <- listaUsuarios
    let users = map parseUserToStringArray usersFields
    print "---------------------------"
    print "   nome    |   pontuacao   "
    print "---------------------------"
    printTable users
    print "---------------------------"
    main

printTable :: [[String]] -> IO()
printTable table = mapM_ print (map prepareTableLine table)

prepareTableLine :: [String] -> String
prepareTableLine (head:[]) = head
prepareTableLine (head:users) = ("   " ++ head ++ "  |  " ++ (prepareTableLine users))

pegaEscolhaInicial :: IO String
pegaEscolhaInicial = do
    print "Bem vindo ao `Who Am I?`!"
    print "O que voce deseja fazer?"
    print "(1) Iniciar novo jogo"
    print "(2) Listar pontuacoes"
    getLine

main :: IO ()
main = do
    escolha <- pegaEscolhaInicial
    if(escolha == "1") then
        novoJogo
    else if(escolha == "2") then
        showPlacar
    else
        main
