module Verifiers(
    removePersonagens,
    verificacaoPersonagem
) where


-- Itera sobre uma lista de personagens, eliminando personagens que não tenham uma determinada caracteristica
removePersonagens:: [[String]] -> String -> [[String]] --Argumentos: lista de personagens a ser iterada e característica
removePersonagens lista caracteristica =
    [personagem | personagem <- lista, caracteristica `elem` personagem]


-- Verifica se o personagem do adversário possui determinada característica física
verificacaoPersonagem::String -> Int -> [[String]]-> Bool
verificacaoPersonagem caracteristica indicePersonagem listaPersonagens = caracteristica `elem` listaPersonagens !! indicePersonagem
