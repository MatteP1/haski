module Interpreter (eval) where

import Ast

eval :: Term -> Term
eval I = I
eval (App I x) = eval x
eval K = K
eval (App K x) = App K (eval x)
eval (App (App K x) _) = eval x
eval S = S
eval (App S x) = App S (eval x)
eval (App (App S x) y) = App (App S (eval x)) (eval y)
eval (App (App (App S x) y) z) = eval (App (App x z) (App y z))
eval (App x y) = eval $ App (eval x) (eval y)
