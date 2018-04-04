queens(N,Qs) :- range(1,N,Ns), permutation(Ns,Qs), safe(Qs).

range(M,N,[M|Ns]) :- M < N, M1 is M+1, range(M1,N,Ns).
range(N,N,[N]).

permutation(Xs,[Z|Zs]) :- select(Z,Xs,Ys), permutation(Ys,Zs).
permutation([],[]).

safe([Q|Qs]) :- safe(Qs), not(attack(Q,Qs)).
safe([]).

attack(X,Xs) :- attack(X,1,Xs).
attack(X,N,[Y|Ys]) :- X is Y+N.
attack(X,N,[Y|Ys]) :- X is Y-N.
attack(X,N,[Y|Ys]) :- N1 is N+1, attack(X,N1,Ys).