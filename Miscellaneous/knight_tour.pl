knight_tour(N,Ns):-
  tour(N,1/1,[1/1],Ns).

tour(N,_,Mvs,Mvs):- L is N * N, length(Mvs,L),!.
tour(N,S,Mvs,Ns):-
  jump(N,S,T),
  \+ member(T,Mvs),
  tour(N,T,[T|Mvs],Ns).

  

jump(N,X/Y,U/V):- 
  jump(X/Y,U/V),
  between(1,N,X),
  between(1,N,Y),
  between(1,N,U),
  between(1,N,V).


jump(X/Y,U/V):- U is X - 1, V is Y - 2.
jump(X/Y,U/V):- U is X - 2, V is Y - 1.
jump(X/Y,U/V):- U is X - 2, V is Y + 1.
jump(X/Y,U/V):- U is X - 1, V is Y + 2.
jump(X/Y,U/V):- U is X + 1, V is Y + 2.
jump(X/Y,U/V):- U is X + 2, V is Y + 1.
jump(X/Y,U/V):- U is X + 2, V is Y - 1.
jump(X/Y,U/V):- U is X + 1, V is Y - 2.

