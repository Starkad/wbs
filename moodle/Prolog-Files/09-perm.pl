/* permutation(Liste,PermListe) */

perm([],[]).

perm([Kopf|Rest],Liste) :-
        perm(Rest,PermRest),
        streiche(Kopf,Liste,PermRest).

/* streiche(X,Liste,ListeOhneX) */
streiche(X,[X|Rest],Rest).
streiche(X,[Kopf|Rest1],[Kopf|Rest2]) :-
	not(X = Kopf),
        streiche(X,Rest1,Rest2).


/* Beispiel perm([1,2,3],[2,1,3]).
	1	CALL:	perm([1,2,3],[2,1,3])?
	2	CALL:	streiche(1,[2,1,3],_?)?
	3	CALL:	streiche(1,[1,3],_?)? 		!Abbruchbedingung erfüllt
	3	EXIT:	streiche(1,[1,3],[3])
	2	EXIT: 	streiche(1,[2,1,3],[2,3])
	4	CALL:	perm([2,3],[2,3])?
	5	CALL:	streiche(2,[2,3],_?)?		!Abbruchbedingung erfüllt
	5	EXIT:	streiche(2,[2,3],[3])
	6	CALL:	perm([3],[3])?
	7	CALL:	streiche(3,[3],_?)?		!Abbruchbedingung erfüllt
	7	EXIT:	streiche(3,[3],[])
	8	CALL:	perm([],[])			!Abbruchbedingung erfüllt
	die restlichen EXIT: Anweisungen um die anderen perm() zu schließen
*/
 	