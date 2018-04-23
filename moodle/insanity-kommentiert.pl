/* Instant Insanity - 4 Würfel, 4 Farben */
/* Standardversion, d.h. nur 4er-Zyklen */

/* Faktenbasis, d.h. Problemwissen */

/* con/4 codiert je eine Kante mit nr, start, ziel, würfel */
con(1,r,g,3).
con(2,r,g,4).
con(3,g,g,2).
con(4,g,y,1).
con(5,g,y,3).
con(6,y,y,1).
con(7,y,b,2).
con(8,y,b,4).
con(9,b,r,1).
con(10,b,r,2).
con(11,b,r,3).
con(12,r,y,4).

/* jeweils vertauschen: */
/* con(K,A,B,C):- */
/* con(K,B,A,C). */
/* (schlecht -> Endlosschleife) */

/* Hat eine Liste lauter verschiedene Elemente? */
/* alldifflist(L) -> true, falls alle Elemente verschieden */
alldifflist([]).
alldifflist([K|R]):-
\+ member(K,R),
alldifflist(R).

/* Pfad im Graphen */
/* path/5, (Kantenliste, Start, Ziel, Würfelliste, Farbliste) */
path([K],S,Z,[C],[S]):-
con(K,S,Z,C).

/* jeweils umgekehrte Kanten: */
 path([K],S,Z,[C],[S]):-
 con(K,Z,S,C).


path([K|R],S,Z,[KC|RC],[S|RN]):-
con(K,S,X,KC),
\+ (S = X),
\+ (Z = X),
path(R,X,Z,RC,RN),
/* RB (2) */
alldifflist([K|R]),
/* RB (1) */
alldifflist([KC|RC]),
/* Def. Pfad (kein Knoten mehrfach) */
alldifflist([S|RN]).

/* Länge einer Liste */
/* lsize(Liste,Size) */
lsize([],0).

lsize([K|R],X):-
lsize(R,X1),
X is X1+1.

concat([],L,L).
concat([K|R1],L,[K|R2]):-
concat(R1,L,R2).

/* Zyklus der Länge 4 */
/* -> finde Pfad von S zu S, prüfe Länge 4 */
cycle4(S,L):-
path(L,S,S,_,_),
lsize(L,4).

/* Lösung: zwei kantenfremde 4-er-Zyklen! */
sol(S,L1,L2):-
cycle4(S,L1),
cycle4(S,L2),
concat(L1,L2,LL),
alldifflist(LL).










/* Regelbasis, d.h. Lösungswissen */