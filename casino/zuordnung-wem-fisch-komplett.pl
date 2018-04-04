hausnummer( X ) :- member( X, [1,2,3,4,5] ).

c1( England, Rot ) :- England == Rot.
c2( Schweden, Hund ) :- Schweden == Hund.
c3( Norwegen ) :- Norwegen == 1.
c4( Dunhill, Gelb ) :- Dunhill == Gelb.
c5( Marlboro, Katze ) :- c5a( Marlboro, Katze ).
c5( Marlboro, Katze ) :- c5b( Marlboro, Katze ).
c5a( Marlboro, Katze ) :- A is Katze + 1, Marlboro == A.
c5b( Marlboro, Katze ) :- B is Katze - 1, Marlboro == B.
c6( Norwegen, Blau ) :- c6a( Norwegen, Blau ).
c6( Norwegen, Blau ) :- c6b( Norwegen, Blau ).
c6a( Norwegen, Blau ) :- A is Norwegen + 1, Blau == A.
c6b( Norwegen, Blau ) :- B is Norwegen - 1, Blau == B.
c7( Pallmall, Vogel ) :- Pallmall == Vogel.
c8( Winfield, Bier ) :- Winfield == Bier.
c9( Daenemark, Tee ) :- Daenemark == Tee.
c10( Deutschland, Rothmanns ) :- Deutschland == Rothmanns.
c11( Dunhill, Pferd ) :- c11a( Dunhill, Pferd ).
c11( Dunhill, Pferd ) :- c11b( Dunhill, Pferd ).
c11a( Dunhill, Pferd ) :- A is Pferd + 1, Dunhill == A.
c11b( Dunhill, Pferd ) :- B is Pferd - 1, Dunhill == B.
c12( Gruen, Kaffee ) :- Gruen == Kaffee.
c13( Gruen, Weiss ) :- A is Weiss - 1, Gruen == A.
c14( Milch ) :- Milch == 3.
c15( Marlboro, Wasser ) :- c15a( Marlboro, Wasser ).
c15( Marlboro, Wasser ) :- c15b( Marlboro, Wasser ).
c15a( Marlboro, Wasser ) :- A is Marlboro + 1, Wasser == A.
c15b( Marlboro, Wasser ) :- B is Marlboro - 1, Wasser == B.


alldiff( A, B, C, D, E ) :- alldifflist( [A, B, C, D, E] ).

alldifflist( [] ).
alldifflist( [X|Y] ) :- \+ member( X, Y ), alldifflist( Y ).

loesung( Rot, Gelb, Blau, Gruen, Weiss,
         England, Schweden, Norwegen, Daenemark, Deutschland,
	 Bier, Tee, Kaffee, Milch, Wasser,
	 Hund, Katze, Vogel, Pferd, Fisch,
	 Dunhill, Rothmanns, Marlboro, Pallmall, Winfield ) :-

hausnummer( Norwegen ),
c3( Norwegen ),
hausnummer( England ),
hausnummer( Schweden ),
hausnummer( Daenemark ),
hausnummer( Deutschland ),
alldiff( Norwegen, England, Schweden, Daenemark, Deutschland ),

hausnummer( Milch ),
c14( Milch ),
hausnummer( Tee ),
c9( Daenemark, Tee ),
hausnummer( Kaffee ),
hausnummer( Wasser ),
hausnummer( Bier ),
alldiff( Bier, Tee, Kaffee, Milch, Wasser ),

hausnummer( Blau ),
c6( Norwegen, Blau ),
hausnummer( Rot ),
c1( England, Rot ),
hausnummer( Gruen ),
c12( Gruen, Kaffee ),
hausnummer( Weiss ),
hausnummer( Gelb ),
c13( Gruen, Weiss ),
alldiff( Rot, Gelb, Blau, Gruen, Weiss ),

hausnummer( Hund ),
c2( Schweden, Hund ),
hausnummer( Katze ),
hausnummer( Vogel ),
hausnummer( Pferd ),
hausnummer( Fisch ),
alldiff( Hund, Katze, Vogel, Pferd, Fisch ),

hausnummer( Dunhill ),
c4( Dunhill, Gelb ),
c11( Dunhill, Pferd ),
hausnummer( Marlboro ),
c5( Marlboro, Katze ),
%	c15( Marlboro, Wasser ),
hausnummer( Pallmall ),
c7( Pallmall, Vogel ),
hausnummer( Winfield ),
c8( Winfield, Bier ),
hausnummer( Rothmanns ),
c10( Deutschland, Rothmanns ),
alldiff( Dunhill, Rothmanns, Marlboro, Pallmall, Winfield ).

anzahl([],0).
anzahl([K|R],N):-
anzahl(R,N2),
N is N2+1.

anzahl_lsg(N):-
findall(( Rot, Gelb, Blau, Gruen, Weiss,
         England, Schweden, Norwegen, Daenemark, Deutschland,
	 Bier, Tee, Kaffee, Milch, Wasser,
	 Hund, Katze, Vogel, Pferd, Fisch,
	 Dunhill, Rothmanns, Marlboro, Pallmall, Winfield ),
	loesung( Rot, Gelb, Blau, Gruen, Weiss,
         England, Schweden, Norwegen, Daenemark, Deutschland,
	 Bier, Tee, Kaffee, Milch, Wasser,
	 Hund, Katze, Vogel, Pferd, Fisch,
	 Dunhill, Rothmanns, Marlboro, Pallmall, Winfield ),L),
	anzahl(L,N).

alldifflist_lsg:-
findall(( Rot, Gelb, Blau, Gruen, Weiss,
         England, Schweden, Norwegen, Daenemark, Deutschland,
	 Bier, Tee, Kaffee, Milch, Wasser,
	 Hund, Katze, Vogel, Pferd, Fisch,
	 Dunhill, Rothmanns, Marlboro, Pallmall, Winfield ),
	loesung( Rot, Gelb, Blau, Gruen, Weiss,
         England, Schweden, Norwegen, Daenemark, Deutschland,
	 Bier, Tee, Kaffee, Milch, Wasser,
	 Hund, Katze, Vogel, Pferd, Fisch,
	 Dunhill, Rothmanns, Marlboro, Pallmall, Winfield ),L),
alldifflist(L).