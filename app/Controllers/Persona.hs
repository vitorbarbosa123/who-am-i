-- Itera sobre uma lista de personagens, eliminando personagens
removePersonagens::[] -> Integer -> String -> () --Argumentos: lista de personagens a ser iterada, iterador/condição de parada, característica
removePersonagens lista, iterador, caracteristica = 
    if iterador < lista length
        then if caracteristica `elem` (lista !! iterador)
            then removePersonagem lista iterador
            else removePersonagens lista (iterador+1)
        else alteraListaCaracteristicas (categoria-1) (caracteristica-1)
    
-- Verifica se o personagem do adversário possui determinada característica física
verificacaoPersonagem::String -> Integer -> Boolean
verificacaoPersonagem caracteristica, indicePersonagem =
    if caracteristica `elem` listaPersonagens !! indicePersonagem
        then True
        else False


-- Remove um personagem da lista de uma partida
removePersonagem::[] -> Integer -> ()
removePersonagem listaPersonagens indice =
    removePorIndice indice listaPersonagens