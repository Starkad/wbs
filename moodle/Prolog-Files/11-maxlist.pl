maxList([A],A).

maxList([K|L],A):-
maxList(L,A),
A >= K.

maxList([K|L],K):-
maxList(L,A),
K >= A.
