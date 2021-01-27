
% tree_ltl(t(V,[]),[V]).
% tree_ltl(t(V,Ts),['(',V | TSL]):-
%   tree_ltl(Ts,TSL),!.
% 
% tree_ltl([],[')']).
% tree_ltl([T|Ts],TSL):-
%   tree_ltl(T,L),
%   tree_ltl(Ts,LS),
%   append(L,LS,TSL),!.
% 


tree_ltl(Tree,L):-tree_ltl_dl(Tree,L-[]).

tree_ltl_dl(t(V,[]),[V|Rem]-Rem):- V \= '(', V \= ')'.

tree_ltl_dl(t(V,Ts),['(', V | Rem]-Rest):-
  forest_ltl_dl(Ts,Rem-[')'|Rest]),!.

forest_ltl_dl([],X-X).

forest_ltl_dl([T|Ts], Tsl-Rest):-
  tree_ltl_dl(T,Tsl-Rem),
  forest_ltl_dl(Ts,Rem-Rest),!.
