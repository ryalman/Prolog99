/*
 */

prime_factors(N,Ls):- factors_(N,2,Ls),!.

factors_(1,_,[]).

factors_(N,2,Ls):-
  \+ 0 is rem(N,2),
  factors_(N,3,Ls).

factors_(N,P,[P|Ls]):-
  0 is rem(N,P),
  N1 is N // P,
  factors_(N1,P,Ls).

factors_(N,P,Ls):-
  P1 is P + 2,
  factors_(N,P1,Ls).
