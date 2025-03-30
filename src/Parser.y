{
module Parser where
import Lexer
}

%name parseSKI
%tokentype { Token }
%error { parseError }

%token
    S   { TokenS }
    K   { TokenK }
    I   { TokenI }
    '(' { TokenLParen }
    ')' { TokenRParen }

%nonassoc S K I
%nonassoc APP
%nonassoc '(' ')'
%%

Term : S            { S }
     | K            { K }
     | I            { I }
     | '(' Term ')'  { $2 }
     | Term Term %prec APP   { App $1 $2 }

{

parseError :: [Token] -> a
parseError _ = error "Parse error"

data Term = S | K | I | App Term Term
          deriving Show
}
