{
module Lexer where
}

%wrapper "basic"

ski :-

  $white+                       ;
  "--".*                        ;
  [Ss]                          { \_ -> TokenS }
  [Kk]                          { \_ -> TokenK }
  [Ii]                          { \_ -> TokenI }
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
