%Номер42
DOMAINS
i=integer
i1=i*
PREDICATES
getAway(i1(i,i)).
CLAUSES
getAway([],L):-!.
getAway([H|L],[]):-getAway(L,H).
getAway([H(h1,h2)|L],[M(m1,m2)|[S(s1,s2)|Z]]):- s1=h1-m1, s2=h2-m2, getAway(L,H). 
GOAL
getAway([(1,2),(3,5),(2,0),(0,0)],X), write(X)