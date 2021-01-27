/*
 */

range(X,X,[X]).
range(X,Y,[X|Ys]):- X < Y, X1 is X + 1, range(X1,Y,Ys).
