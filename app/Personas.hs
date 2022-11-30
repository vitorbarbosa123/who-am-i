module Personas where

-- Personagens utilizados no jogo, na forma de listas. Cada lista possui, além de um número identificador (índice 0) e nome (índice 1) únicos para cada entidade, um conjunto de características
-- físicas intrínsecas (em ordem: sexo (índice 2), cor dos cabelos (índice 3), etnia (índice 4), cor dos olhos (índice 5), acessório  (índice 6)), totalizando sete itens por pessoa
p1 = ["1","Luiza","Feminino","Preto","Branca","Pretos","Oculos"]    
p2 = ["2","Renato","Masculino","Preto","Negra","Verdes","Chapeu"]
p3 = ["3","Carolina","Feminino","Castanho","Parda","Castanhos","Brinco"]
p4 = ["4","Antonio","Masculino","Castanho","Indigina","Azuis","Piercing"]
p5 = ["5","Debora","Feminino","Louro","Negra","Verdes","Chapeu"]
p6 = ["6","Paulo","Masculino","Louro","Indigina","Pretos","Oculos"]
p7 = ["7","Tatiana","Feminino","Ruivo","Indigina","Azuis","Piercing"]
p8 = ["8","Clovis","Masculino","Ruivo","Branca","Castanhos","Brinco"]
p9 = ["9","Fatima","Feminino","Preto","Parda","Castanhos","Piercing"]
p10 = ["10","Diego","Masculino","Preto","Indigina","Azuis","Brinco"]
p11 = ["11","Cecilia","Feminino","Castanho","Branca","Verdes","Oculos"]
p12 = ["12","Felipe","Masculino","Castanho","Negra","Pretos","Chapeu"]
p13 = ["13","Alessandra","Feminino","Louro","Branca","Azuis","Brinco"]
p14 = ["14","Joao","Masculino","Louro","Parda","Castanhos","Piercing"]
p15 = ["15","Andreia","Feminino","Ruivo","Negra","Pretos","Chapeu"]
p16 = ["16","Adriano","Masculino","Ruivo","Parda","Verdes","Oculos"]


{- Uma lista contendo as características, em ordem alfabética: sexo (feminino/masculino), cor do cabelo (castanho,louro,preto,ruivo), etnia (branca,Indigina,negra,parda),
cor dos olhos (azuis,castanhos,pretos,verdes), acessório (brinco,Chapeu,Piercing,Oculos). O jogador humano tem que confiar na própria memória -} 
listasCaracteristicasIA =[["Feminino","Masculino"],["Castanho","Louro","Preto","Ruivo"],["Branca","Indigina","Negra","Parda"],["Azuis","Castanhos","Pretos","Verdes"],["Brinco","Chapeu","Oculos","Piercing"]]


-- Lista contendo todos os personagens. Jogador e IA recebem uma cópia idêntica ao início de cada partida
listaPersonagens = [p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16]

--Código aproveitado de Davi
printTable :: [[String]] -> IO()
printTable table = mapM_ print (map prepareTableLine table)

prepareTableLine :: [String] -> String
prepareTableLine (head:[]) = head
prepareTableLine (head:users) = ("   " ++ head ++ "  |  " ++ (prepareTableLine users))