%Номер67
pred(Tree, Result):- /*Производная вида C*(x^p), p>2*/
    Tree =.. [(*), C, X], 
    X =.. [(^), x, P], 
    NewC is P*C,
    NewP is P - 1,
    NewP > 1,
    NewX =.. [(^), x, NewP],
    Result =.. [(*), NewC, NewX], !.
pred(Tree, Result):- /*Производная вида C*(x^2)*/
    Tree =.. [(*), C, X], 
    X =.. [(^), x, P], 
    NewC is P*C,
    NewP is P - 1,
    NewP == 1,
    NewX = x,
    Result =.. [(*), NewC, NewX], !.
pred(Tree, Result):- /*Производная вида x^p, p>2*/
    Tree =.. [(^), x, P], 
    NewP is P - 1,
    NewP > 1,
    NewX =.. [(^), x, NewP],
    Result =.. [(*), P, NewX], !.
pred(Tree, Result):- /*Производная вида x^2*/
    Tree =.. [(^), x, P], 
    NewP is P - 1,
    NewP == 1,
    Result =.. [(*), P, x], !.
pred(Tree, Result):- /*Производная вида C*x*/
    Tree =.. [(*), C, x], 
    Result = C, !.
pred(Tree, Result):- /*Производная вида x*/
    Tree == x, 
    Result = 1, !.
pred(Tree, Result):- /*Производная вида C*/
    Tree =..[_C], 
    Result = 0, !.
pred(Tree, Result):- /*Производная полинома без констант*/
	Tree =.. [Name, Left, Right],
	pred(Left, N1),
	pred(Right, N2),
    N1 \== 0, N2 \== 0,
	Result =.. [Name, N1, N2], !.
pred(Tree, Result):- /*Производная полинома с константой слева*/
	Tree =.. [_Name, Left, Right],
	pred(Left, N1),
	pred(Right, N2),
    N1 == 0, N2 \== 0,
	Result = N2, !.
pred(Tree, Result):- /*Производная полинома с константой справа*/
	Tree =.. [_Name, Left, Right],
	pred(Left, N1),
	pred(Right, N2),
    N1 \== 0, N2 == 0,
	Result = N1, !.
pred(Tree, Result):- /*Производная вида -C*(x^p)*/
    Tree =.. [Name, Right],
    Name == (-),
    NewRight =.. [(*), -1, Right],
    pred(NewRight, N),
    Result = N, !.
pred(Tree, Result):- /*Производная вида +C*(x^p)*/
    Tree =.. [Name, Right],
    Name == (+),
    NewRight =.. [(*), 1, Right],
    pred(NewRight, N),
    Result = N, !.