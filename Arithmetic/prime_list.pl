/*
 */

:-[is_prime].

prime_list(F,T,[]):- F > T,!.
prime_list(F,T,[F|Ls]):-
  is_prime(F),
  next_(F,Next),
  prime_list(Next,T,Ls),!.

prime_list(F,T,Ls):- next_(F,X), prime_list(X,T,Ls),!.

