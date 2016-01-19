longueur([],0).
longueur([_|L],A) :- longueur(L,B), A is B+1.

membre(_, []) :- false.
membre(A,[X|L]) :- A = X -> true ; membre(A,L).

ajoute_en_queue(A,[],[A]).
ajoute_en_queue(A,[B|L],[B|LF]) :- ajoute_en_queue(A,L,LF).

concatene([],L,L).
concatene([A|L1],L2,[A|LF]) :-  concatene(L1,L2,LF).

insert_trie(A,[],[A]).
/*insert_trie(A,[X|L],[X|LF]) :- X < A, insert_trie(A,L,LF).
insert_trie(A,[X|L],[A|LF]) :- X >= A, insert_trie(X,L,LF).*/
insert_trie(A,[X|L],[A|[X|L]]) :- A < X , !.
insert_trie(A,[X|L],[X|LF]) :- insert_trie(A,L,LF).

divise([],[],[]).
divise([A],[A],[]).
divise([A,B|L],[A|L1],[B|L2]) :- divise(L,L1,L2).

fusion([],L,L).
fusion([A|L1],L2,LF) :- insert_trie(A,L2,L),fusion(L1,L,LF).

tri_fusion([],[]):-!.
tri_fusion([A],[A]):-!.
/*tri_fusion([A,B|L], LF) :- divise([A,B|L],L1,L2),tri_fusion(L1,LF1),tri_fusion(L2,LF2),fusion(LF1,LF2,LF).*/
tri_fusion(L,LF) :- divise(L,L1,L2),tri_fusion(L1,LF1),tri_fusion(L2,LF2),fusion(LF1,LF2,LF).
