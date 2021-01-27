/*
 * Last element of 1-element list is the element inside the list.
 * Last element of a list L[X|Xs] is the last element of the Xs.  
 */

/* 
 * last_element(X,[X]).
 * last_element(X,[Y|Ys]):- last_element(X,Ys).
 */

last_element(X,[Next|Rest]) :-
  list_last_(Rest,Next,X).

list_last_([],X,X).
list_last_([Y|Ys],_,X):- list_last_(Ys,Y,X).

/*
 *?- last_element(X, [a,b,c,d]).
 * X = d.
 */
