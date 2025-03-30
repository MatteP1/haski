{
module Lexer where
}

%wrapper "basic"

ski :-

  $white+                       ;
  "--".*                        ;
  S                             { \_ -> TokenS }
  K                             { \_ -> TokenK }
  I                             { \_ -> TokenI }
  \(                            { \_ -> TokenLParen }
  \)                            { \_ -> TokenRParen }
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
