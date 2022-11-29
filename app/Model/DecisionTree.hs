module Model.DecisionTree(
    getTraits,
    getFunction,
    renderRandom,
    getElemByIndex,
    getSex,
    getHair,
    getSkin,
    getEyes,
    getProps,
    saveChoices,
    verifyPersona,
    remainingFunctions
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
renderRandom::[String] -> IO Int 
renderRandom array =
   randomRIO (1, length array)

-- Usa o número aleatório como indice para buscar um elemento em algum array
getElemByIndex::[String] -> IO String
getElemByIndex list = do
    index <- renderRandom list
    return $ list!!index

getSex::[String]-> IO String
getSex sex = do
    result <- getElemByIndex sex
    return result 

getEyes::[String]->IO String
getEyes eyes = do
    result <- getElemByIndex eyes
    return result

getSkin::[String]-> IO String
getSkin skin = do 
    result <- getElemByIndex skin
    return result

getHair::[String]->IO String
getHair hair = do 
    result <- getElemByIndex hair
    return result

getProps::[String]->IO String
getProps props = do
    result <- getElemByIndex props
    return result

-- Salva a decisão feita em um novo array

-- como fazer referência aos lets declarados no inicio?
saveChoices::[String] -> [String] -> [String] -> [String] -> [String] ->  IO [String]
saveChoices sex hair skin eyes props = do
    sexChoice <- getSex sex
    hairChoice <- getHair hair
    skinChoice <- getSkin skin
    eyesChoice <- getEyes eyes
    propsChoice <- getProps props
    return [sexChoice, hairChoice, skinChoice, eyesChoice, propsChoice]

-- Verifica se a persona "montada" é a mesma que a escolhida
verifyPersona::[String]->[String]->Bool
verifyPersona persona personaCorreta =
    personaCorreta == (verifyTraits persona personaCorreta 0)
    -- passar ele pra main, para dizer que a IA ganhou

-- Retorna uma lista com as caracteristicas da persona "montada" que estao na
-- persona correta ou a string "erro" na ordem: (sex, hair, skin, eyes, props)
verifyTraits::[String]->[String]->Int->[String]
verifyTraits personaMontada personaCorreta i
    | (null caracteristica) = []  -- fim da lista / condicao de parada

    | otherwise =
        if (caracteristica == personaCorreta!!i) then
            [caracteristica] ++ (verifyTraits personaMontada personaCorreta i+1)

        else
            ["erro"] ++ (verifyTraits personaMontada personaCorreta i+1)
    where caracteristica = personaMontada!!i

-- essa função deve retornar um arrays de função.
-- Retorna uma lista com nomes das funcoes que ainda podem rodar
remainingFunctions::[[String]]->[String]->[String]->[String]
remainingFunctions categorias escolhasJogador funcoes
    | (null caracteristica) = []     -- fim da lista / condicao de parada

    | caracteristica `elem` categoria =           -- se acertou a categoria:
        [head funcoes] ++ (remainingFunctions (tail categorias) (tail escolhasJogador) (tail funcoes)) -- adiciona (nomeDaFuncao, True) a resposta

    | otherwise =
        (remainingFunctions (tail categorias) (tail escolhasJogador) (tail funcoes)) -- adiciona (nomeDaFuncao, False) a resposta
    where
        categoria = head categorias -- sex
        caracteristica = head escolhasJogador -- "M"

        -- [getSex, getSkin]
        

