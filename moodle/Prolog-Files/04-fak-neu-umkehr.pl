fak(0,1).
fak(X,FakX):-
fak(X1,FakX1),
X is X1 + 1,
FakX is X * FakX1.
