{
module Lexer (scanTokens) where
}

%wrapper "basic"

ski :-

  $white+                       ;
  "--".*                        ;
  S                             { \s -> TokenS }
  K                             { \s -> TokenK }
  I                             { \s -> TokenI }
  \(                            { \s -> TokenLParen }
  \)                            { \s -> TokenRParen }
{

-- The token type:
data Token = TokenS
           | TokenK
           | TokenI
           | TokenLParen
           | TokenRParen
           deriving (Eq,Show)

scanTokens = alexScanTokens

}
