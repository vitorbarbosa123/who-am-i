module DecisionTree(
    getTraits,
    getFunction,
    getLength,
    renderRandom,
    getElemByIndex,
    getSex,
    getHair,
    getSkin,
    getEyes,
    getProps,
    saveChoices,
    verifyPersona
) where

import System.Random
import Data.List

let sex = ["Feminino","Masculino"],
let hair = ["Castanho","Louro","Preto","Ruivo"],
let skin = ["Branca","Indígena","Negra","Parda"],
let eyes = ["Azuis","Castanhos","Pretos","Verdes"],
let props = ["Brinco","Chapéu","Óculos","Piercing"]

-- Guarda as caracteristicas possíveis de cada categoria
getTraits::[[String]]
getTraits = [sex, hair, skin, eyes, props]

-- Guarda os nomes das funcoes get
getFunction::[String]
getFunction = ["getSex", "getHair", "getSkin", "getEyes", "getProps"]

-- Função que recebe uma lista e retorna o tamanho da lista
getLength:: [T]->Int
getLength list = length list

-- Gera um número aleatório entre 0 e o tamanho de uma lista genérica
renderRandom:: Int -> Int
renderRandom arrayLength =
   getLength arrayLength
   randomIO (1, arrayLength)

-- Usa o número aleatório como indice para buscar um elemento em algum array
getElemByIndex:: [T] -> String
getElemByIndex list index result =
    renderRandom index
    result <- list!!index
    where index <- getLength list

getSex:: [String]->String
getSex sex result =
    result <- getElemByIndex sex

getEyes:: [String]->String
getEyes eyes result =
    result <- getElemByIndex eyes

getSkin:: [String]->String
getSkin skin result =
    result <- getElemByIndex skin

getHair:: [String]->String
getHair hair result =
    result <- getElemByIndex hair

getProps:: [String]->String
getProps props result =
    result <- getElemByIndex props

-- Salva a decisão feita em um novo array
saveChoices:: [String] -> [String] -> [String] -> [String] -> [String] -> [String]
saveChoices sex hair skin eyes props =
    choice <- getSex sex
    choice <- getHair hair
    choice <- getSkin skin
    choice <- getEyes eyes
    choice <- getProps props
    where choice [] = []

-- Verifica se a persona "montada" é a mesma que a escolhida
verifyPersona::[String]->[String]->Bool
verifyPersona persona personaCorreta =
    personaCorreta == (verifyTraits persona personaCorreta 0)

-- Retorna uma lista com as caracteristicas da persona "montada" que estao na
-- persona correta ou a string "erro" na ordem: (sex, hair, skin, eyes, props)
verifyTraits::[String]->[String]->Int->[String]
verifyTraits personaMontada personaCorreta i =
    | (null caracteristica) = []  -- fim da lista / condicao de parada

    | otherwise =
        | (caracteristica  == personaCorreta!!i) =
            [caracteristica] ++ (verifyTraits personaMontada personaCorreta i+1)

        | otherwise =
            ["erro"] ++ (verifyTraits personaMontada personaCorreta i+1)
    where caracteristica = personaMontada!!i

-- Retorna uma lista com nomes das funcoes que ainda podem rodar
funcoesRestantes::[[String]]->[String]->[String]->[(T,Boolean)]
funcoesRestantes [categoria:caudaC] [acerto:caudaA] [funcao:caudaF] =
    | (categoria == []) = []     -- fim da lista / condicao de parada

    | acerto `elem` categoria =  -- se acertou a categoria:
        adicionaTupla (funcao, True) (funcoesRestantes caudaC caudaA caudaF)  -- adiciona (nomeDaFuncao, True) a resposta

    | otherwise =
        adicionaTupla (funcao, False) (funcoesRestantes caudaC caudaA caudaF) -- adiciona (nomeDaFuncao, False) a resposta

adicionaTupla::(T,Bool)->[T]->[T]
adicionaTupla tupla lista = [tupla] ++ lista

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