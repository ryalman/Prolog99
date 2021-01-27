/*
 * The last but one element of a 2-element list is the first element.
 * The last but one element of a list with more elements is the last but one
 * element of the list without the first element.
 */

last_but_one(X,[Y,T|Ys]):- last_but_one_(Ys,T,Y,X).

last_but_one_([],_,X,X).
last_but_one_([Y|Rest],T,_,X):- last_but_one_(Rest,Y,T,X).

/*
 * ?- last_but_one(X,[a,b,c,d]).
 * X = c.
 */
