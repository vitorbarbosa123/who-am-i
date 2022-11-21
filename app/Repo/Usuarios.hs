{-# LANGUAGE OverloadedStrings #-}
module Repo.Usuarios (criaUsuarioSeNaoExistir, somaPontosUsuario) where

import Control.Applicative
import Database.SQLite.Simple
import Database.SQLite.Simple.FromRow

data UserField = UserField String Int deriving (Show)
instance FromRow UserField where
  fromRow = UserField <$> field <*> field

criaUsuarioSeNaoExistir :: String -> IO [UserField]
criaUsuarioSeNaoExistir nome = do
  conn <- open "wai.db"
  execute conn "INSERT OR IGNORE INTO usuarios (nome, pontos) VALUES (?, 0)"
    (Only (nome :: String))
  queryNamed conn "SELECT * from usuarios WHERE nome = :nome" [":nome" := nome] :: IO [UserField]

somaPontosUsuario :: String -> Int -> IO [UserField]
somaPontosUsuario nome pontos = do
  conn <- open "wai.db"
  execute conn "UPDATE usuarios SET pontos = pontos + ? WHERE nome = ?" (pontos :: Int, nome :: String)
  queryNamed conn "SELECT * from usuarios WHERE nome = :nome" [":nome" := nome] :: IO [UserField]