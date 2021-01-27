/*
 * A flattened of a nested list is the concatination of the flatten of the first
 * element and the flatten of the remaining list.
 */



/*
 * Looks procedural but works fine :).
 */

flatten_([],_).
flatten_([E|Es],X):-
  append(Ex,Esx,X),
  flatten(Es,Esx),
  is_list(E),flatten(E,Ex);
  Ex is [E].

/*
 * ?- flatten([a,[b,[c,d],e]],X).
 * X = [a, b, c, d, e].
 */

/*
 * Original solution is an elegant one.  
 *
 * my_flatten(X,[X]) :- \+ is_list(X).
 * my_flatten([],[]).
 * my_flatten([X|Xs],Zs) :- my_flatten(X,Y), my_flatten(Xs,Ys),append(Y,Ys,Zs).
 */

