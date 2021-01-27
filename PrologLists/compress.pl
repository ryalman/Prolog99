/*
 * A list with 1 or less elements is already compressed.
 * A list of the form [X,X|Xs] compressed as [X|Xs].
 * A list of the fomr [X,Y|Ys] is [X,Y | compress Ys].
 */

 
compress([],[]).
compress([X],[X]).
compress([X,X|Xs],Y):-compress([X|Xs],Y).
compress([X0,X1|Xs],[X0|Ys]):- \+ X0 = X1, compress([X1|Xs],Ys).
