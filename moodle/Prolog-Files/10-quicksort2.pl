/* quicksort2(Liste,Eilst). */
quicksort2([],[]).
quicksort2([Kopf|Rest],Eilst):-
partition2(Rest,Kopf,Kleine,Grosse),
quicksort2(Kleine,Eeikln),
quicksort2(Grosse,Egorss),
concat2(Eeikln,[Kopf|Egorss],Eilst).

/* partition2(Liste,Grenze,Kleine,Grosse)*/
partition2([],Grenze,[],[]).
partition2([Kopf|Rest],Grenze,[Kopf|Kleine],Grosse):-
Kopf =< Grenze,
partition2(Rest,Grenze,Kleine,Grosse).
partition2([Kopf|Rest],Grenze,Kleine,[Kopf|Grosse]):-
Kopf > Grenze,
partition2(Rest,Grenze,Kleine,Grosse).

/* concat2(Liste1,Liste2,Liste1und2) */
concat2([],Liste,Liste).
concat2([Kopf|Rest],Liste,[Kopf|RestListe]):-
concat2(Rest,Liste,RestListe).
