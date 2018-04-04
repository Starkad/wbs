:- use_module(library(bounds)).

send([[S,E,N,D], [M,O,R,E], [M,O,N,E,Y]])  :-
              Digits   =  [S,E,N,D,M,O,R,Y],
              Carries  =  [C1,C2,C3,C4],
              Digits  in  0..9,
              Carries in  0..1,

              M                #=              C4,
              O  +  10  *  C4  #=  M  +  S  +  C3,
              N  +  10  *  C3  #=  O  +  E  +  C2,
              E  +  10  *  C2  #=  R  +  N  +  C1,
              Y  +  10  *  C1  #=  E  +  D,

              M  #>=  1,
              S  #>=  1,
              all_different(Digits),
              label(Digits).
