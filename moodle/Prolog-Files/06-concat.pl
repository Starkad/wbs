/*concat(Liste1,Liste2,Liste1und2)     */ 
concat([],Liste,Liste). concat([Kopf|Rest],Liste,[Kopf|RestListe]):-
concat(Rest,Liste,RestListe).

