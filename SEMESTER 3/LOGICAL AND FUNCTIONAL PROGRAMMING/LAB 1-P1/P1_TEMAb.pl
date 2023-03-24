%b. Sa se scrie un predicat care adauga dupa 1-ul, al 2-lea, al 4-lea,
% al 8-lea ...element al unei liste o valoare vdata.

% ex:[1, 2, 3, 4, 5, 6, 7, 8, 9] -> [1, 10, 2, 10, 3, 4, 10, 5, 6, 7, 8, 10, 9]
%    [1,2,3,4]->[1,0,2,0,3,4,0]
%Predicat determinist
%Model de flux: (i,i,o),(i,i,i)
% Modelul matematic:
% insert_value(l1 l2...ln, val, pos, putereDoi) =
%	{ [] , n = 0
%	{ l1 U val U insert_value(l2..ln, val, pos+1, putereDoi*2) , pos = putereDoi
%	{ l1 U insert_value(l2..ln, val, pos+1, putereDoi), pos != putereDoi
%insertMain(l1...ln,Val)=insert_value(l1...ln,Val,1,1)
%
%insert_value(L:Lista,Val:Integer,Pos:Integer,PutereDoi:Integer,R:Lista)
%L:lista in care se face adaugarea
%Val:valoarea de adaugat
%Pos:pozitia curenta
%PutereDoi:poitia pe care trebuie adaugat urmatorul element
insert_value([], _, _, _, []).
insert_value([H|T], Val, Pos, PutereDoi, [H, Val|R]):-
    Pos =:= PutereDoi,
    NewPos is Pos+1,
    NewPutereDoi is PutereDoi*2,
    insert_value(T, Val, NewPos, NewPutereDoi, R).
insert_value([H|T], Val, Pos, PutereDoi, [H|R]):-
    Pos =\= PutereDoi,
    NewPos is Pos+1,
    insert_value(T, Val, NewPos, PutereDoi, R).

insertMain(L, Val, R):-
    insert_value(L, Val, 1, 1, R).
