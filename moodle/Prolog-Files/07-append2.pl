% append(Element,AnListe,ErgListe)

append2(Element,[],[Element]).

append2(Element,[Kopf|Liste],[Kopf|ListeMitElement]):-
append2(Element,Liste,ListeMitElement).
