% Faktenbasis 
maennlich(bernd). 
weiblich(monika). 
ehepaar(bernd,monika). 
weiblich(samantha). 
mutter(monika,samantha).

% Der Vater eines Kindes ist mit der Mutter des Kindes verheiratet: 
vater(Vater,Kind):-
ehepaar(Vater,Mutter), 
mutter(Mutter,Kind).

% Zwei Kinder mit gleicher Mutter sind Geschwister: 
geschwister(Kind1,Kind2):-
not(Kind1 = Kind2),
mutter(Mutter,Kind1), 
mutter(Mutter,Kind2).

