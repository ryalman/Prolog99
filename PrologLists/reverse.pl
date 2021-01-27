/*
 * Reverse of a list is a list that is created by appending the first element
 * of the list to the reverse of the remaining elements.
 */

reverse(Xs,[T|Ts]):-
  reverse_(Ts,[T],Xs).

reverse_([],Xs,Xs).
reverse_([T|Ts],As,Xs):-
  reverse_(Ts,[T|As],Xs).

/*
 * ?- reverse(X,[1,2,3,4,5,6]).
 * X = [6, 5, 4, 3, 2, 1].
 */
