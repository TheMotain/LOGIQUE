longueur([],0).
longueur([_|L],A) :- longueur(L,B), A is B+1.

membre(_, []) :- false.
membre(A,[X|L]) :- A = X -> true ; membre(A,L).

ajoute_en_tete(X,L,[X|L]).

ajoute_en_queue(A,[X|L],B) :- ajoute_en_queue(A
