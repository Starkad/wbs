:- use_module(library(bounds)).

send([[S,E,N,D], [M,O,R,E], [M,O,N,E,Y]])  :-
              Digits   =  [S,E,N,D,M,O,R,Y],
              Digits  in  0..9,

              1000 * S + 100 * E + 10 * N + D + 1000 * M + 100 * O + 10 * R + E #=                        10000 * M + 1000 * O + 100 * N + 10 * E + Y,

              M  #>=  1,
              S  #>=  1,
              all_different(Digits),
              label(Digits).
