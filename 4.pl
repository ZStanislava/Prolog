%Номер 102
root(List,Test1,RenList):-
  tolist(List,0,RenList,List),
  build(RenList,Test1,0),!.

% Создание списков соседних вершин
% CL - Current List
% CM - Current Member

tolist([],_,[],X).
tolist([H|T],N,RenList,X):-
  CL is N+1,
  tolist(T,CL,List,X),
  findlist(H,CL,0,FindList,X),
  RenList = [FindList|List].

findlist([],CL,_,[],X).
findlist([H|T],CL,N,FindList,X):-
  CM is N+1,
  findlist(T,CL,CM,List,X),
  ifthenelse(H=1,member(CL,CM,Mem,X,0),Mem=0),
  ifthenelse(Mem=0,FindList=List,FindList=[Mem|List]).

member(CL,CM,0,[],_).
member(CL,CM,Member,[X|Y],N):-
  M is N+1,
  member(CL,CM,Mem,Y,M),
  ifthenelse(CL=\=M,memberlist(CM,Memlist,X,0),Memlist=0),
  ifthenelse(Memlist=0,Member=Mem,Member=M).
  
memberlist(CM,0,[],_).
memberlist(CM,Member,[X|Y],N):-
  ML is	N+1,
  memberlist(CM,Mem,Y,ML),
  ifthenelse((ML=CM,X=1),Member=1,Member=Mem).

% Создание списков ссылочных номеров 
% Запись их на соотв. позиции

build([],Test1,_).
build([H|T],Test1,N):-
  K is N+1,
  recordz(Test1,[],Ref),
  build(T,Test1,K),
  renlist(H,Test1,RenList),
  replace(Ref,RenList).

renlist([],Test1,[]).
renlist([H|T],Test1,RenList):-
  renlist(T,Test1,List),
  recorded_nth(Test1,H,_,Ref),
  RenList = [Ref|List].