/*
 * kth element of a list is either the current element or k-1th element of 
 * the rest of the list
 */

element_at(X,[X|_], 1).
element_at(X,[_|Ys],K):-
  K > 1,
  L is K - 1,
  element_at(X,Ys, L).
/*
 * ?- element_at(X,[a,b,c,d,e,f], 4).
 * X = d .
 */
