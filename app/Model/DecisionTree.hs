module Model.DecisionTree(
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

sex = ["Feminino","Masculino"]
hair = ["Castanho","Louro","Preto","Ruivo"]
skin = ["Branca","Indígena","Negra","Parda"]
eyes = ["Azuis","Castanhos","Pretos","Verdes"]
props = ["Brinco","Chapéu","Óculos","Piercing"]

-- Guarda as caracteristicas possíveis de cada categoria
getTraits::[[String]]
getTraits = [sex, hair, skin, eyes, props]

-- Guarda os nomes das funcoes get
getFunction::[String]
getFunction = ["getSex", "getHair", "getSkin", "getEyes", "getProps"]

-- Gera um número aleatório entre 0 e o tamanho de uma lista genérica
renderRandom:: [T] -> Int
renderRandom array =
   randomRIO (1, length array)

-- Usa o número aleatório como indice para buscar um elemento em algum array
getElemByIndex:: [T] -> String
getElemByIndex list result =
    result list!!index
    where index = renderRandom list

getSex:: [String]->String
getSex sex result =
    result getElemByIndex sex

getEyes:: [String]->String
getEyes eyes result =
    result getElemByIndex eyes

getSkin:: [String]->String
getSkin skin result =
    result getElemByIndex skin

getHair:: [String]->String
getHair hair result =
    result getElemByIndex hair

getProps:: [String]->String
getProps props result =
    result getElemByIndex props

-- Salva a decisão feita em um novo array
saveChoices:: [String] -> [String] -> [String] -> [String] -> [String] -> [String]
saveChoices sex hair skin eyes props =
    [getSex sex
    getHair hair
    getSkin skin
    getEyes eyes
    getProps props]
    

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
