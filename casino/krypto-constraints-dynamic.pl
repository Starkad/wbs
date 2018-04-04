:- use_module(library(bounds)).

krypto(List):-
flatten(List,Letters),
shrink(Letters,LetterList),
% write(LetterList),
LetterList in 0..9,
all_different(LetterList),
sum(List),
label(LetterList)
,
\+ List = [[0|_],_,_],
\+ List = [_,[0|_],_],
\+ List = [_,_,[0|_]]
.


shrink([],[]).
shrink([A|R],L):- shrink(R,RL), app(A,RL,L).

app(A,[],[A]):- !.
app(A,AL,AL):- isIn(A,AL), !.
app(A,AL,L):- !, append([A],AL,L).

isIn(A,[B|R]):- A==B, !.
isIn(A,[B|R]):- !, isIn(A,R).

% alldifferent([]).
% alldifferent([H|R]):- \+ member(H,R).

sum(L):- sum(L,0).

sum([A,B],Carry):-
row(A,AValue),
row(B,BValue),
Carry + AValue #= BValue.

sum([A,B|Rest],Carry):-
row(A,AValue),
sum([B|Rest],BValue),
Carry + AValue #= BValue.

row(L,V):- row(L,V,0).

row([],Acc,Acc).
row([H|T],Sum,Acc):-
Acc1 #= Acc * 10 + H,
row(T,Sum,Acc1).
