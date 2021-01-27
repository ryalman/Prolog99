:-[degree_color].

bipartite(G):-
  w_powel(G,Cl),
  max_colors(Cl,N),
  N is 2.

max_colors(Cl,M):-max_colors(Cl,M,0),!.

max_colors([],M,M):-!.

max_colors([(_,C) | Cs],M,N):-
  C > N,
  max_colors(Cs,M,C),!.

max_colors([_ | Cs],M,N):- max_colors(Cs,M,N),!.
