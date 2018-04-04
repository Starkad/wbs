append([],Liste,Liste). 
append([Element|Rest],Liste,[Element|Neuer_Rest]):- 
          append(Rest,Liste,Neuer_Rest). 

ist_Element_von(Element,Liste):-append(_,[Element|_],Liste). 

korrekte_Stellung_8([]). 
korrekte_Stellung_8([[X,Y]|Rest]):- 
                        korrekte_Stellung_8(Rest), 
                        ist_Element_von(Y,[1,2,3,4,5,6,7,8]), 
                        bedroht_nicht([X,Y],Rest). 

bedroht_nicht(_,[]). 
bedroht_nicht([X1,Y1],[[X2,Y2]|Rest]) 
           :- Y1\=Y2, 
              H1 is X1+Y1, H2 is X2+Y2, H1\=H2, 
              H3 is X1-Y1, H4 is X2-Y2, H3\=H4, 
              bedroht_nicht([X1,Y1],Rest). 

loesung_8([[1,Y1],[2,Y2],[3,Y3],[4,Y4],[5,Y5],[6,Y6], 
                  [7,Y7],[8,Y8]]). 

start_8:-loesung_8(X), 
                korrekte_Stellung_8(X),
                write(X). 

