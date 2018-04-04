maennlich(bernd).
maennlich(stefan).
maennlich(bastian).
weiblich(monika).
weiblich(sarah).
weiblich(erika).
weiblich(samantha).
mutter(monika,samantha).
ehepaar(bernd,monika).
ehepaar(stefan,sarah).
bruder(bernd,sarah).
bruder(bastian,bernd).

vater(Vater,Kind):-ehepaar(Vater,Mutter),mutter(Mutter,Kind).

geschwister(Kind1,Kind2):-mutter(Mutter,Kind1),mutter(Mutter,Kind2).

bruder(Mann,Person):-
maennlich(Mann),
geschwister(Mann,Person).

schwester(Frau,Person):-
weiblich(Frau),
geschwister(Frau,Person).

onkel(Onkel,Person):-
bruder(Onkel,Vater),
vater(Vater,Person).

onkel(Onkel,Person):-
bruder(Onkel,Mutter),
mutter(Mutter,Person).

onkel(Onkel,Person):-
ehepaar(Onkel,Tante),
bruder(Vater,Tante),
vater(Vater,Person).

onkel(Onkel,Person):-
ehepaar(Onkel,Tante),
schwester(Mutter,Tante),
mutter(Mutter,Person).
