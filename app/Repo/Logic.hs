module Repo.Logic where

import System.Random
import Repo.Usuarios
import Repo.Personas

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