uebertrag(0).
uebertrag(1).

ziffer(X):-member(X,[1,2,3,4,5,6,7,8,9]).
ziffer0(0).
ziffer0(X):-ziffer(X).

alldifflist([]).
alldifflist([K|R]):-
\+ member(K,R),
alldifflist(R).

spalte1(D,E,Y,X1):- Y is D + E - 10*X1.
spalte2(N,R,E,X1,X2):- E is N + R + X1 - 10*X2.
spalte3(E,O,N,X2,X3):- N is E + O + X2 - 10*X3.
spalte4(S,M,O,X3,X4):- O is S + M + X3 - 10*X4.
spalte5(M,X4):- M = X4.

loesung(D,E,M,N,O,R,S,Y):-
uebertrag(X4), ziffer(M), spalte5(M,X4),
uebertrag(X3), ziffer(S), ziffer0(O), spalte4(S,M,O,X3,X4),
uebertrag(X2), ziffer0(E), ziffer0(N), spalte3(E,O,N,X2,X3),
uebertrag(X1), ziffer0(R), spalte2(N,R,E,X1,X2),
ziffer0(D), ziffer0(Y), spalte1(D,E,Y,X1)
	,
	alldifflist([D,E,M,N,O,R,S,Y])
.

anzahl([],0).
anzahl([K|R],A):-
anzahl(R,Arest),
A is Arest+1.

anzahl_lsg(A):-
findall((D,E,M,N,O,R,S,Y),loesung(D,E,M,N,O,R,S,Y),L),
anzahl(L,A).

alldiff_lsg:-
findall((D,E,M,N,O,R,S,Y),loesung(D,E,M,N,O,R,S,Y),L),
alldifflist(L).


 
