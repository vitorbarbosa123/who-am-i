import System.Random
import Data.List

let sex = ["Feminino","Masculino"],
let hair = ["Castanho","Louro","Preto","Ruivo"],
let skin = ["Branca","Indígena","Negra","Parda"],
let eyes = ["Azuis","Castanhos","Pretos","Verdes"],
let props = ["Brinco","Chapéu","Óculos","Piercing"]

-- Guarda as caracteristicas possíveis de cada categoria
getCaracteristicas::[[String]]
caracteristicas = [sex, hair, skin, eyes, props]

-- Guarda os nomes das funcoes get
getFuncao::[String]
getFuncao = ["getSex", "getHair", "getSkin", "getEyes", "getProps"]

-- Todo: criar uma função que recebe uma lista e retorna o tamanho da lista
getLength:: [T]->Int
getLength list = length list

-- Todo: criar uma função que gera um número aleatório entre 0 e o tamanho de uma
-- lista genérica
renderRandom:: Int -> Int
renderRandom arrayLength =
   getLength arrayLength
   randomIO (1, arrayLength)

-- Todo: criar uma função que usa o número aleatório anterior como indice para buscar
-- um elemento em algum array
getElemByIndex:: [T] -> String
getElemByIndex list index result =
    renderRandom index
    result <- list!!index
    where index <- getLength list


-- Todo: criar funções que usa a anterior(deve-se passar o array específico)
-- e retorna o elemento em um indice:

-- Todo: função que busca o sexo
    getSex:: [String]->String
    getSex sex result =
        result <- getElemByIndex sex


-- Todo: função que busca a cor dos olhos
    getEyes:: [String]->String
    getEyes eyes result =
        result <- getElemByIndex eyes

-- Todo: função que busca a cor da pele
    getSkin:: [String]->String
    getSkin skin result =
        result <- getElemByIndex skin

-- Todo: função que busca a cor do cabelo
    getHair:: [String]->String
    getHair hair result =
        result <- getElemByIndex hair

-- Todo: função que busca o acessório
    getProps:: [String]->String
    getProps props result =
        result <- getElemByIndex props

-- Todo: uma função que salva a decisão feita em um novo array
    saveChoices:: [String] -> [String] -> [String] -> [String] -> [String] -> [String]
    saveChoices sex hair skin eyes props =
        choice <- getSex sex
        choice <- getHair hair
        choice <- getSkin skin
        choice <- getEyes eyes
        choice <- getProps props
        where choice [] = []

-- Todo: uma função que verifica se a persona "montada" é a mesma que a escolhida
verificaAcertos::[String]->[String]->Bool
verificaAcertos persona personaCorreta = personaCorreta == (verificaCaracteristicas persona personaCorreta)

-- Funcao que retorna uma nova lista com as caracteristicas da persona "montada"
-- que estao na persona correta: ou seja as caracterísicas que foram acertadas
-- Todo: ajustar para funcionar corretamente junto a funcao 'funcoesRestantes'
verificaCaracteristicas::[String]->[String]->[String]
verificaCaracteristicas personaMontada personaCorreta =
    [ caracteristica | caracteristica <- personaMontada, caracteristica `elem` personaCorreta]

-- Todo: uma função que utiliza a da linha 22 e repassa para as funções da linha 11
-- em diante que: caso o elemento retornado seja igual ao já selecionado anteriormente
-- validar se o valor booleano do mesmo é false(ou seja, pode ser selecionado de novo)
-- se for, a função vai "rodar" novamente

-- recebe uma lista de listas (cada lista interna eh um categoria de caracteristicas),
-- e uma lista de caracteristicas acertadas e uma lista de nomes de funcoes relacionadas.
-- retorna uma lista com as funcoes que ainda podem rodar
funcoesRestantes::[[String]]->[String]->[String]->[(T,Boolean)]
funcoesRestantes [categoria:caudaC] [acerto:caudaA] [funcao:caudaF] =
    | (categoria == []) = []     -- para

    | acerto `elem` categoria =  -- se acertou a categoria:
        adicionaTupla (funcao, True) (funcoesRestantes caudaC caudaA)  -- adiciona (nomeDaFuncao, True) a resposta

    | otherwise =
        adicionaTupla (caudaF, False) (funcoesRestantes caudaC caudaA) -- adiciona (nomeDaFuncao, False) a resposta


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