#!/usr/bin/swipl
/*
# Author: Manuel Mueller<mam1205@thi.de>
# Date: 2018-04-23
*/
v(r).
v(g).
v(b).
v(ye).
/*k(index,farbe1,farbe2,wuerfelnr)*/
k(1,r,g,3).
k(2,r,g,4).
k(3,g,g,3).
k(4,g,ye,1).
k(5,g,ye,3).
k(6,ye,ye,1).
k(7,ye,b,2).
k(8,ye,b,4).
k(9,b,r,1).
k(10,b,r,2).
k(11,b,r,3).
k(11,r,ye,4).
/*rückwartsdefinition*/
/*wunderbare Endlosschleife ist ein überdefiniertes System*/
/*k(INDEX,FARBE1,FARBE2,WUERFEL):-
  k(INDEX,FARBE2,FARBE1,WUERFEL).
*/

tour([Idx1,Idx2,Idx3,Idx4]):-
  k(Idx1,F1,F2,W1),
  k(Idx2,F2,F3,W2),
  k(Idx3,F3,F4,W3),
  k(Idx4,F4,F1,W4),
  unique([Idx1,Idx2,Idx3,Idx4]),
  unique([W1,W2,W3,W4]).

unique([]).

unique([H|R]):-
  not(member(H,R)),
  unique(R).

losung(T1,T2):-
  tour(T1),
  tour(T2),
  concati(T1,T2,C),
  unique(C).
  
concati([],Liste,Liste).

concati([Kopf|Rest],Liste,[Kopf|RestListe]):-
concati(Rest,Liste,RestListe).
