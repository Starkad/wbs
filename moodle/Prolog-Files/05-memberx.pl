/* memberx(Element,Liste). */

memberx(Element,[Element|_]).

memberx(Element,[Element2|Liste]):-
% not(Element = Element2),
memberx(Element,Liste).
