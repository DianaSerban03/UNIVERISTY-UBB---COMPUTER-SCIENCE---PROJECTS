%Sa se determine cea mai lunga secventa de numere pare consecutive
% dintr-o lista (daca sunt mai multe secvente delungime maxima, una
% dintre ele).
% Predicat determinist
% Model de flux: (i,o),(i,i)
% ex:secv_pare([1,2,4,5,2,4,6],R)=>R=[2,4,6]
%    secv_pare([1,2,4,5,6,8],R)=>R=[6,8]
%list_pare(L:Lista,R:Lista temporara,R:Lista finala)
%L:lista in care se calucleaza sevc max de nr pare
%R:Lista in care se stocheaza temporar o secv
%R:Lista finala de secv max
%list_pare(l1...ln,Tmp,R)= [], n=0
%                          lista_pare(l2...ln,l1 U Tmp,R),l1%2==0
%                          lista_pare(l2...ln,0,Tmp), l1%2!=0,Tmp>R
%                          lista_pare(l2...ln,0,R),l1%2!=0,altfel
%secv_pare(l1...ln)=list_pare(l1..ln,0)
%% mylength(L:lista, R:integer) - length e functie predefinita in
% SWI-Prolog, ne trebuie alta denumire
% L - lista de simboluri
% R - rezultatul, lungimea listei
% model de flux (i, o), (i, i)
%
mylength([],0):-!.
mylength([_|L],M):-
    mylength(L,M1),
    M is M1+1.

secv_pare(In,Out) :-
    list_pare(In,[],ROut),
    reverse(ROut,Out).

list_pare([],R,R).
list_pare([H|T],Tmp,R):-
    H mod 2 =:= 0,
    list_pare(T,[H|Tmp],R).
list_pare([H|T],Tmp,R):-
    H mod 2 =\= 0,
    list_pare(T,[],Rtmp),
    mylength(Rtmp,LR),
    mylength(Tmp,LT),
    (
        LT > LR
    ->  R = Tmp
    ;   R = Rtmp
    ).
