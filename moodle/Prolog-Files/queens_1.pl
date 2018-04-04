ist_Permutation_von([],[]). 
ist_Permutation_von(Liste,[Element|Rest]):- 
            ist_Permutation_von(Neuer_Rest,Rest), 
            einfuegen_in(Element,Neuer_Rest,Liste). 

einfuegen_in(Element,Liste,[Element|Liste]). 
einfuegen_in(Element1,[Element2|Liste],[Element2|Neue_Liste]):- 
            einfuegen_in(Element1,Liste,Neue_Liste). 

bedroht_nicht(_,[]). 
bedroht_nicht([X1,Y1],[[X2,Y2]|Rest]) 
           :- Y1\=Y2, 
              H1 is X1+Y1, H2 is X2+Y2, H1\=H2, 
              H3 is X1-Y1, H4 is X2-Y2, H3\=H4, 
              bedroht_nicht([X1,Y1],Rest), 
              bedroht_nicht([X2,Y2],Rest). 

start8([[1,Y1],[2,Y2],[3,Y3],[4,Y4],[5,Y5],[6,Y6],[7,Y7],[8,Y8]]):- 
 ist_Permutation_von([Y1,Y2,Y3,Y4,Y5,Y6,Y7,Y8],[1,2,3,4,5,6,7,8]), 
 bedroht_nicht([1,Y1],[[2,Y2],[3,Y3],[4,Y4],[5,Y5],[6,Y6], 
                              [7,Y7],[8,Y8]]). 

