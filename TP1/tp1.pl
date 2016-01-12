contenu(tigre).
contenu(princesse).
contenu(null).

pancarte1(tigre,Y) :- contenu(Y).
pancarte1(X,princesse) :- contenu(X).
pancarte2(princesse,Y) :- contenu(Y).

salle1(X,Y) :- pancarte1(X,Y),pancarte2(X,Y).
salle1(X,Y) :- contenu(X),contenu(Y),not(pancarte1(X,Y)),not(pancarte2(X,Y)).

pancarte3(princesse,tigre).
pancarte4(X,Y) :- contenu(X),contenu(Y),X \= Y.

salle2(X,Y) :- pancarte3(X,Y),not(pancarte4(X,Y)).
salle2(X,Y) :- pancarte4(X,Y),not(pancarte3(X,Y)).

afficheSalle1 :- salle1(X,Y), write(X), write(' '), write(Y).
afficheSalle2 :- salle2(X,Y), write(X), write(' '), write(Y).

porte1(X,Y,null) :- contenu(X),contenu(Y),X \= Y,X \= null, Y \= null.
porte2(tigre,Y,Z) :- contenu(Y),contenu(Z), Y \= Z, Y \= tigre, Z \= tigre.
porte3(X,Y,null) :- contenu(X),contenu(Y),X \= Y,X \= null, Y \= null.

salle3(X,Y,Z) :- porte1(X,Y,Z),porte2(X,Y,Z),not(porte3(X,Y,Z)).
salle3(X,Y,Z) :- porte1(X,Y,Z),porte3(X,Y,Z),not(porte2(X,Y,Z)).
salle3(X,Y,Z) :- porte3(X,Y,Z),porte2(X,Y,Z),not(porte1(X,Y,Z)).
salle3(X,Y,Z) :- porte1(X,Y,Z),not(porte2(X,Y,Z)),not(porte3(X,Y,Z)),X = princesse.
salle3(X,Y,Z) :- porte2(X,Y,Z),not(porte1(X,Y,Z)),not(porte3(X,Y,Z)),X = princesse.
salle3(X,Y,Z) :- porte3(X,Y,Z),not(porte1(X,Y,Z)),not(porte2(X,Y,Z)),X = princesse.
