% Définir des faits

homme(pierre).
homme(marc).
homme(paul).
homme(jacques).
femme(marie).
femme(sophie).
femme(julie).

parent(pierre, paul).
parent(marie, paul).
parent(marc, sophie).
parent(jacques, marc).
parent(julie, sophie).


% Définir des règles

pere(X, Y) :- homme(X), parent(X, Y).
mere(X, Y) :- femme(X), parent(X, Y).

grand_parent(X, Y) :- parent(X, Z), parent(Z, Y).
frere_ou_soeur(X, Y) :- parent(Z, X), parent(Z, Y), not(X-Y).
oncle_ou_tante(X, Y) :- frere_ou_soeur(X, Z), parent(Z, Y).
cousin(X, Y) :- parent(Z, X), frere_ou_soeur(Z, W), parent(W, Y).

longueur([], 0).
longueur([_|T], L) :- longueur(T, N), L is N + 1.

element(X, [X|_]).
element(X, [_|T]) :- element(X, T).

