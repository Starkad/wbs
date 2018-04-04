revers2([],[]).
revers2([Kopf|Rest],Etsil):-
revers2(Rest,Liste),
append2(Kopf,Liste,Etsil).

append2(Element,[],[Element]).
append2(Element,[Kopf|Liste],[Kopf|ListeMitElement]):-
append2(Element,Liste,ListeMitElement).