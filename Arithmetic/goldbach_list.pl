
:- ensure_loaded(goldbach).

goldbach_list(X,Y):-
  goldbach_list(X,Y,2),!.

goldbach_list(X,Y,_):- X > Y,!.
goldbach_list(X,Y,N):- X < 4, goldbach_list(4,Y,N).

goldbach_list(X,Y,N):- 1 is rem(X,2), X1 is X + 1, goldbach_list(X1,Y,N).

goldbach_list(X,_,N):-
  goldbach(X,[P1,P2]),!,
  P1 >= N,
  P2 >= N,
  \+ writef("%d = %d + %d\n",[X,P1,P2]).
  
goldbach_list(X,Y,N):- X1 is X + 2, goldbach_list(X1,Y,N).

