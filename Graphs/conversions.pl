% I think the conversions below is enough to practice.

gterm_adjlist(graph(Vs,Es),Ns):-
  term_list_g(graph(Vs,Es),N),
  sort(N,Nss),
  merge_nodes(Nss,Ns),!.

gterm_adjlist(digraph(Vs,Es),Ns):-term_list_dg(digraph(Vs,Es),Ns),!.

adjlist_friendly([],[]):-!.
adjlist_friendly([n(X,[V|Vs]) | Ns], [X-V | Hs]):-
  adjlist_friendly([n(X,Vs) | Ns],Hs),!.

adjlist_friendly([n(X,[V]) | Ns],[X-V | Hs]):-
  adjlist_friendly(Ns,Hs),!.

adjlist_friendly([n(X,[]) | Ns],[X | Hs]):-
  adjlist_friendly(Ns,Hs),!.

term_list_g(graph([],[]),[]):-!.

term_list_g(graph([V|Vs],[]),[n(V,[]) | Ns]):-
  term_list_g(graph(Vs,[]),Ns),!.

term_list_g(graph([V|Vs],[e(V,X)|Es]),[n(V,[X|Xs]),n(X,[V]) | Ns]):-
  term_list_g(graph([V | Vs],Es),[n(V,Xs) | Ns]),!.

term_list_g(graph([V|Vs],[e(T,X) | Es]),[n(V,[]) | Ns]):-
  term_list_g(graph(Vs,[e(T,X) | Es]), Ns).

term_list_g(graph([V|Vs],[_| Es]),Ns):-
  term_list_g(graph([V|Vs],Es), Ns),!.


term_list_dg(digraph([],[]),[]):-!.

term_list_dg(digraph([V|Vs],[]),[n(V,[]) | Ns]):-
  term_list_dg(digraph(Vs,[]),Ns),!.

term_list_dg(digraph([V|Vs],[e(V,X)|Es]),[n(V,[X|Xs]) | Ns]):-
  term_list_dg(digraph([V | Vs],Es),[n(V,Xs) | Ns]),!.

term_list_dg(digraph([V|Vs],[e(T,X) | Es]),[n(V,[]) | Ns]):-
  term_list_dg(digraph(Vs,[e(T,X) | Es]), Ns).

term_list_dg(digraph([V|Vs],[_| Es]),Ns):-
  term_list_dg(digraph([V|Vs],Es), Ns),!.

merge_nodes([],[]):-!.
merge_nodes([n(X,Xs),n(X,Ys) | Ns], Rs):-
  append(Xs,Ys,XYs),
  merge_nodes([n(X,XYs) |Ns],Rs),!.
merge_nodes([n(X,Xs) | Ns],[n(X,Xs) | Rs]):-
  merge_nodes(Ns,Rs),!.
