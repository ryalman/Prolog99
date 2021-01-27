

hbal_tree(0,nil):-!.

hbal_tree(N,t(x,L,R)):-
  Nn is N - 1,
  select_height(Nn,Ln,Rn),
  hbal_tree(Ln,L),
  hbal_tree(Rn,R).

select_height(N,N,N).
select_height(N,N,Rn):- N > 0, Rn is N - 1.
select_height(N,Ln,N):- N > 0, Ln is N - 1.
