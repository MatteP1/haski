module Main where

import Ast
import Interpreter
import Lexer
import Parser
import System.IO (hFlush, stdout)

interpretSKI :: String -> Term
interpretSKI prog = eval $ parseSKI $ scanTokens prog

main :: IO ()
main = do
  putStrLn "Write your SKI program:"
  hFlush stdout
  prog <- getLine
  print $ interpretSKI prog
