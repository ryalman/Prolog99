
:- ensure_loaded(is_prime).

goldbach(X,Ys):-
  X >= 4,
  0 is rem(X,2),
  goldbach(X,Ys,2).

goldbach(X,[P1,P2],P1):-
  X > P1,
  is_prime(P1),
  P2 is X - P1,
  is_prime(P2).

goldbach(X,Ys,2):- goldbach(X,Ys,3).
goldbach(X,Ys,N):- X > N, P is N + 2, goldbach(X,Ys,P).
