{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE InstanceSigs #-}

module Repo.Personas (listPersonas, parseToStringArray) where

import           Control.Applicative ()
import Database.SQLite.Simple (execute, open, query_, field
  , Only(Only), NamedParam((:=))
  , FromRow(..))
import Database.SQLite.Simple.FromRow (RowParser)

data PersonaField =
  PersonaField String String String String String String String deriving (Show) 

instance FromRow PersonaField where
  fromRow :: RowParser PersonaField
  fromRow = PersonaField <$> field
    <*> field
    <*> field
    <*> field
    <*> field
    <*> field
    <*> field

listPersonas :: IO [PersonaField]
listPersonas = do
  conn <- open "wai.db"
  query_ conn "SELECT * from personas" :: IO [PersonaField]

parseToStringArray :: PersonaField -> [String]
parseToStringArray (PersonaField id nome sexo cor_cabelo etnia cor_olhos acessorio)  = [id, nome, sexo, cor_cabelo, etnia, cor_olhos, acessorio]
