%1. Se dau N puncte in plan (prin coordonatele lor). Se cere sa se
% determine toate submultimile de puncte coliniare.
%Model matematic:
%coliniare(x1,y1,x2,y2,x3,y3)=true,x1=x2=x3
%                             true,y1=y2=y3
%                             true,(y3-y1)/(y2-y1)=(x3-x1)/(x2-x1)
%                             false,altfel
%subsets(l1...ln)=[], n=0
%                 l1 U subsets(l2...ln), n>=1
%                 subsets(l2....ln), n>=1
%leng(l1 l2..ln)=0,n=0
%                1+len(l2...ln),altfel
%
%coliniare_all(P1 P2...Pn)=coliniare(P1P2P3)
%                          coliniare_all(P2..Pn)
%
% find_sol(P1 P2...Pn)=(Pi1,Pi2,...Pik), k>=3 and coliniare_all(Pi1,Pi2...Pik)
%
% coliniare(x1:Integer,y1:Integer,x2:Integer,y2:Integer,x3:Integer,y3:Integer)
% [x1,y1]= Coordonatele pe axa Ox si Oy ale punctului X1
% [x2,y2]= Coordonatele pe axa Ox si Oy ale punctului X2
% [x3,y3]= Coordonatele pe axa Ox si Oy ale punctului X3
%
% leng(L:Lista)
% L= lista a carui lungime este calculata
%
% coliniare_all(P:Lista)
% P= lista de puncte pentru care se verifica daca sunt coliniare
%
% find_sol(P:Lista)
% P= Lista de puncte pentru care se gasesc punctele coliniare


%Lungimea unei liste
%model de flux (i,o)-determinist
leng([],0).
leng([_|T],Res):-
leng(T,Res1),
Res is Res1+1.

%Verifica daca 3 puncte sunt coliniare
%model de flux(i,i,i)-determinist
coliniare([X,_],[X,_],[X,_]):-!.
coliniare([_,Y],[_,Y],[_,Y]):-!.
coliniare([X1,Y1],[X2,Y2],[X3,Y3]):-
    (Y3-Y1)/(Y2-Y1) =:= (X3-X1)/(X2-X1).

%Verifica daca toate punctele dintr-o lista sunt coliniare
%model de flux (i)-determinist
coliniare_all([H1,H2,H3]):-
    coliniare(H1,H2,H3),!.
coliniare_all([H1,H2,H3|T]):-
    coliniare(H1,H2,H3),
    coliniare_all([H2,H3|T]).

%Verifica daca lungimea unei liste este >=3
%model de flux (i)-determinist
len_b3(L):-
    leng(L,R),
    R >= 3.

%Determine submultimile unei liste
%model de flux (i,o)nedeterminist
subsets([],[]).
subsets([H|T],[H|Res]):-
    subsets(T,Res).
subsets([_|T],Res):-
    subsets(T,Res).

%Pune conditiile asupra solutiei candidat
%model de flux(i,o)-nedeterminist
find_sol(L,Aux):-
    subsets(L,Aux),
    len_b3(Aux),
    coliniare_all(Aux).

%Acumulam solutiile partiale intr-o lista
%getAll(L,Res):-
%      findall(Partial,find_sol(L,Partial),Res).

%Afisam solutiile partiale
print_sol(L):-
    find_sol(L,P),
    write(P),
    nl,
    fail.

%print_sol([[1,1],[2,2],[8,3],[4,4],[5,5]]).
%=>[[1,1],[2,2],[4,4],[5,5]]
%[[1,1],[2,2],[4,4]]
%[[1,1],[2,2],[5,5]]
%[[1,1],[4,4],[5,5]]
%[[2,2],[4,4],[5,5]]
%print_sol([[1,1],[2,2],[8,3],[4,4],[5,5],[9,3],[10,3]]).
%=>[[1,1],[2,2],[4,4],[5,5]]
%[[1,1],[2,2],[4,4]]
%[[1,1],[2,2],[5,5]]
%[[1,1],[4,4],[5,5]]
%[[2,2],[4,4],[5,5]]
%[[8,3],[9,3],[10,3]]
%print_sol([[1,1],[3,5],[7,2]])=>false (NU EXISTA).
%
