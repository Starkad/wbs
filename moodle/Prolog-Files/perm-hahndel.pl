streiche(X, [X|Rest], Rest).
streiche(X, [F|Rest], [F|ORest]) :- streiche(X,Rest,ORest).

perm([X|Y], Z) :- perm(Y,W), streiche(X,Z,W).
perm([],[]).
