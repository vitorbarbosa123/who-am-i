import System.Random
import Data.List

-- Todo: criar uma função que recebe uma lista e retorna o tamanho da lista
getLength:: [T]->Int
getLength = length T

-- Todo: criar uma função que gera um número aleatório entre 0 e o tamanho de uma
-- lista genérica
renderRandom:: Int -> Int
getLength arrayLength
renderRandom =
   randomIO (1, arrayLength)

-- Todo: criar uma função que usa o número aleatório anterior como indice para buscar
-- um elemento em algum array
getElemByIndex:: [T] -> Int -> String
getElemByIndex list index result =
    result <- list!!index 


-- Todo: criar funções que usa a anterior(deve-se passar o array específico)
-- e retorna o elemento em um indice:

-- Todo: função que busca o sexo

-- Todo: função que busca a cor dos olhos

-- Todo: função que busca a cor da pele

-- Todo: função que busca a cor do cabelo

-- Todo: função que busca o acessório


-- Todo: uma função que salva a decisão feita em um novo array

-- Todo: uma função que verifica se a persona "montada" é a mesma que a escolhida

-- Todo: uma função que utiliza a da linha 22 e repassa para as funções da linha 11
-- em diante que: caso o elemento retornado seja igual ao já selecionado anteriormente
-- validar se o valor booleano do mesmo é false(ou seja, pode ser selecionado de novo)
-- se for, a função vai "rodar" novamente


-- Imprime reticências na tela para humanizar a tomada de decisão da IA. Perguntar ao professor ou monitor se a definição do método 
-- pode utilizar um valor concreto ao invés de um tipo

-- esperaIA::Integer -> () -- Sempre iniciar com 0
-- esperaIA inicio,totalReticencias = 
--     if inicio < 3
--         then do threadDelay 300000 -- Aprox. 0.3 segundos
--                 threadDelay 300000 putStr(". ") 
--                 threadDelay 300000 putStr(". ")
--                 threadDelay 300000 putStrLn(".")
--                 threadDelay 300000
--                 esperaIA inicio+1 totalReticencias
--         else putStrLn("!")