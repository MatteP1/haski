module Ast (Term (..)) where

data Term = S | K | I | App Term Term
  deriving (Eq)

instance Show Term where
  show S = "S"
  show K = "K"
  show I = "I"
  show (App x y) = "(" ++ (show x) ++ (show y) ++ ")"
