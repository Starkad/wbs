stuhl( X ) :- member( X, [1,2,3,4,5,6] ).

c1( Eigner, Blau ) :- Eigner is Blau + 3.
c1( Eigner, Blau ) :- Eigner is Blau - 3.
c2( Theodor, Broschke ) :- Theodor == Broschke.
c3( Broschke ) :- Broschke == 2.
c3( Broschke ) :- Broschke == 4.
c3( Broschke ) :- Broschke == 6.
c4( Albert, Pink ) :- Albert == Pink.
c5( Albert, Blau ) :- Albert < 4, Blau < 4.
c5( Albert, Blau ) :- Albert > 3, Blau > 3.
c6( Karl, Rot ) :- Karl is Rot + 3.
c7( Poschner, Karl ) :- Poschner \= Karl.
c8( Poschner, Peter ) :- Poschner \= Peter.
c9( Poschner ) :- Poschner == 6.
c10( Fechner, Erwin ) :- Fechner \= Erwin.
c11( Fechner, Friedrich ) :- Fechner < Friedrich.
c12( Weiss ) :- Weiss == 1.
c13( Peter, Lang ) :- Peter is Lang - 1.
c14( Lang, Gruen ) :- Lang == Gruen.


alldiff( A, B, C, D, E, F ) :- alldifflist( [A, B, C, D, E, F] ).

alldifflist( [] ).
alldifflist( [X|Y] ) :- \+ member( X, Y ), alldifflist( Y ).

loesung( Albert, Erwin, Friedrich, Karl, Peter, Theodor,
         Broschke, Eigner, Fechner, Habert, Lang, Poschner,
	 Weiss, Gelb, Gruen, Blau, Rot, Pink ) :-

stuhl( Broschke ),
c3( Broschke ),
stuhl( Eigner ),
stuhl( Fechner ),
stuhl( Habert ),
stuhl( Lang ),
stuhl( Poschner ),
c9( Poschner ),
alldiff( Broschke, Eigner, Fechner, Habert, Lang, Poschner ),

stuhl( Weiss ),
c12( Weiss ),
stuhl( Gelb ),
stuhl( Gruen ),
c14( Lang, Gruen ),
stuhl( Blau ),
c1( Eigner, Blau ),
stuhl( Rot ),
stuhl( Pink ),
alldiff( Weiss, Gelb, Gruen, Blau, Rot, Pink ),

stuhl( Albert ),
c4( Albert, Pink ),
c5( Albert, Blau ),
stuhl( Erwin ),
c10( Fechner, Erwin ),
stuhl( Friedrich ),
c11( Fechner, Friedrich ),
stuhl( Karl ),
c6( Karl, Rot ),
c7( Poschner, Karl ),
stuhl( Peter ),
c8( Poschner, Peter ),
c13( Peter, Lang ),
stuhl( Theodor ),
c2( Theodor, Broschke ),
alldiff( Albert, Erwin, Friedrich, Karl, Peter, Theodor ).


anzahl([],0).
anzahl([K|R],N):-
anzahl(R,N2),
N is N2+1.

anzahl_lsg(N):-
findall(( Albert, Erwin, Friedrich, Karl, Peter, Theodor,
         Broschke, Eigner, Fechner, Habert, Lang, Poschner,
	 Weiss, Gelb, Gruen, Blau, Rot, Pink ),
	loesung( Albert, Erwin, Friedrich, Karl, Peter, Theodor,
         Broschke, Eigner, Fechner, Habert, Lang, Poschner,
	 Weiss, Gelb, Gruen, Blau, Rot, Pink ),L),
	anzahl(L,N).

alldifflist_lsg:-
findall(( Albert, Erwin, Friedrich, Karl, Peter, Theodor,
         Broschke, Eigner, Fechner, Habert, Lang, Poschner,
	 Weiss, Gelb, Gruen, Blau, Rot, Pink ),
	loesung( Albert, Erwin, Friedrich, Karl, Peter, Theodor,
         Broschke, Eigner, Fechner, Habert, Lang, Poschner,
	 Weiss, Gelb, Gruen, Blau, Rot, Pink ),L),
alldifflist(L).