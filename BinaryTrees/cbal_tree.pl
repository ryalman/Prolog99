/*
 */

cbal_tree(0,nil):-!.
cbal_tree(N,t(x,L,R)):-
  Nn is N - 1,
  Half is Nn // 2,
  Rest is Nn - Half,
  select(Half,Rest,Ln,Rn),
  cbal_tree(Ln, L),
  cbal_tree(Rn, R).

select(X,X,X,X):-!.
select(X,Y,Y,X).
select(X,Y,X,Y).
