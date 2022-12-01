{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE InstanceSigs #-}

module Repo.Usuarios
    ( criaUsuarioSeNaoExistir,
      listaUsuarios,
      somaPontosUsuario,
      parseUserToStringArray,
      getNome,
      getPontos) where

import Control.Applicative ()
import Database.SQLite.Simple
    ( execute,
      open,
      queryNamed,
      field,
      query_,
      Only(Only),
      NamedParam((:=)),
      FromRow(..) )
import Database.SQLite.Simple.FromRow (RowParser)

data UserField = UserField String Int deriving (Show) 

instance FromRow UserField where
  fromRow :: RowParser UserField
  fromRow = UserField <$> field <*> field

criaUsuarioSeNaoExistir :: String -> IO [UserField]
criaUsuarioSeNaoExistir nome = do
  conn <- open "wai.db"
  execute
    conn
    "INSERT OR IGNORE INTO usuarios (nome, pontos) VALUES (?, 0)"
    (Only (nome :: String))
  queryNamed conn "SELECT * from usuarios WHERE nome = :nome" [":nome" := nome] :: IO [UserField]

somaPontosUsuario :: String -> Int -> IO [UserField]
somaPontosUsuario nome pontos = do
  conn <- open "wai.db"
  execute
    conn
    "UPDATE usuarios SET pontos = pontos + ? WHERE nome = ?"
    (pontos :: Int, nome :: String)
  queryNamed conn "SELECT * from usuarios WHERE nome = :nome" [":nome" := nome] :: IO [UserField]

getNome :: UserField -> String
getNome (UserField nome _) = nome

getPontos :: UserField -> Int
getPontos (UserField _ pontos) = pontos

listaUsuarios :: IO [UserField]
listaUsuarios = do
  conn <- open "wai.db"
  query_ conn "SELECT * from usuarios" :: IO [UserField]

parseUserToStringArray :: UserField -> [String]
parseUserToStringArray (UserField nome pontos)  = [nome, show pontos]
