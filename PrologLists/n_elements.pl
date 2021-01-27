/*
 * Number of elements of a list is 1 plus the number of the elements of the list
 * without the first element.
 */

n_elements(0,[]).
n_elements(N,[_|Xs]):-
  n_elements(K,Xs),
  N is K + 1.
