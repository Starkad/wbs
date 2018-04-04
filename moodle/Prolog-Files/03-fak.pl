fakultaet(0,1).
fakultaet(X,FakX):-
XNeu is X - 1,
fakultaet(XNeu,FakXNeu),
FakX is X * FakXNeu.
