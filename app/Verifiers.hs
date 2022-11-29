module Verifiers(
    removePersonagens,
    verificacaoPersonagem
) where


<<<<<<< HEAD
-- Itera sobre uma lista de personagens, eliminando personagens
-- Retornar a lista anterior com os personagens removidos.
removePersonagens:: [String] -> Int -> String -> () --Argumentos: lista de personagens a ser iterada, iterador/condição de parada, característica
removePersonagens lista iterador caracteristica = do 
    if iterador < (length lista)
        then if caracteristica `elem` (lista !! iterador)
            then removePersonagem lista iterador
            else removePersonagens lista (iterador+1)
        else putStr ("Erro aqui!")
    

-- Verifica se o personagem do adversário possui determinada característica física
verificacaoPersonagem::[String] -> String -> Int -> Bool
verificacaoPersonagem listaPersonagens caracteristica indicePersonagem = do
    if caracteristica `elem` (listaPersonagens !! indicePersonagem)
        then True
        else False


-- Remove um personagem da lista de uma partida
-- Retornar a lista anterior com os personagens removidos.
removePersonagem::[String] -> Int -> IO()
removePersonagem listaPersonagens indice = do
    removePorIndice indice listaPersonagens


-- Remove um elemento de uma lista de acordo com o índice fornecido
removePorIndice :: Int -> [String] -> [String]
removePorIndice = \n -> \list ->
    case n of 
        0 -> tail list
        otherwise -> head list: removePorIndice (n-1) (tail list)


--alteraListaCaracteristicas:: Bool -> String -> Integer -> ()
--alteraListaCaracteristicas operador caracteristica indice = do 
--    Nothing
=======
-- Itera sobre uma lista de personagens, eliminando personagens que não tenham uma determinada caracteristica
removePersonagens:: [[String]] -> String -> [[String]] --Argumentos: lista de personagens a ser iterada e característica
removePersonagens lista caracteristica =
    [personagem | personagem <- lista, caracteristica `elem` personagem]


-- Verifica se o personagem do adversário possui determinada característica física
verificacaoPersonagem::String -> Int -> [[String]]-> Bool
verificacaoPersonagem caracteristica indicePersonagem listaPersonagens = caracteristica `elem` listaPersonagens !! indicePersonagem
>>>>>>> 0052b35ed6f69a41d06824cb9239a8db093a542f
