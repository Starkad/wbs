% Faktenbasis 
maennlich(bernd). 
maennlich(hans).
weiblich(monika). 
weiblich(samantha). 
ehepaar(bernd,monika). 
ehepaar(X,Y):-ehepaar(Y,X).
mutter(monika,samantha).
mutter(monika,hans).



% Der Vater eines Kindes ist mit der Mutter des Kindes verheiratet: 
vater(Vater,Kind):-
ehepaar(Vater,Mutter), 
mutter(Mutter,Kind).

% Zwei Kinder mit gleicher Mutter sind Geschwister: 
geschwister(Kind1,Kind2):-
not(Kind1 = Kind2),
mutter(Mutter,Kind1), 
mutter(Mutter,Kind2).

onkel(Onkel,Kind):-
geschwister(Onkel,E),
mutter(E,Kind):
vater(E,Kind).

onkel(Onkel,Kind):-
verheiratet(Onkel,G),
onkel(G,Kind).

