	% Abschlussbedingung als Fakt
	sumList(0,[]).
	
	% Rekursive Regel
	sumList(Sum,[Kopf|Rest]):-
	sumList(SumRest,Rest),
	Sum is SumRest+Kopf.

	% Variante sumPositive
	% Abschlussbedingung als Fakt
	sumPositive(0,[]).
	
	% Rekursive Regel 1
	sumPositive(Sum,[Kopf|Rest]):-
	Kopf>0,
	sumPositive(SumRest,Rest),
	Sum is SumRest+Kopf.
	
	% Rekursive Regel 2
	sumPositive(Sum,[Kopf|Rest]):-
	Kopf=<0,
	sumPositive(Sum,Rest).
	