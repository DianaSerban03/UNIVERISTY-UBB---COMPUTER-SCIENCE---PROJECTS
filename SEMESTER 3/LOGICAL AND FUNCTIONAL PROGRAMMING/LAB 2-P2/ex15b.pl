%Se da o lista eterogena, formata din numere intregi si liste de numere intregi. Sa se inlocuiasca fiecare sublista cu cea mai lunga secventa de numere pare consecutive din sublista respectiva.
% De ex:[1, [2, 1, 4, 6, 7], 5, [1, 2, 3, 4], 2, [1, 4, 6, 8, 3], 2, [1, 5], 3]
%=>[1, [4, 6], 5, [4], 2, [4, 6, 8], 2, [], 3]
%[1,[[1,2,4,5,2,4,6],2,[1,2,4,5,6,8]) =>[ 1,[2,4,6],2,[6,8]]
%
%Model de flux: (i,i),(i,o)
%Model matematic:
%lista_inl(l1..ln,R)=[],n=0
%                  lista_inl(l2...ln,l1 U R), l1:Element
%                  lista_inl(l2...ln,secv_pare(l1) U R), l1:Lista
%
%lista_inl(L:Lista,R:Lista)
%L:Lista din care se extrag elementele si sublistele
%R:Lista in care se depune lista rezultata

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
    length(Rtmp,LR),
    length(Tmp,LT),
    (
        LT > LR
    ->  R = Tmp
    ;   R = Rtmp
    ).
lista_inl([],[]).
lista_inl([H|T],[R|Rez]) :- secv_pare(H,R),lista_inl(T,Rez).
lista_inl([H|T],[H|Rez]) :- number(H),lista_inl(T,Rez).
