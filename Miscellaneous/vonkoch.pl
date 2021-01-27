:- use_module(library(clpfd)).
vonkoch(T,Ns,Nsv):- 
  edges(T,Es),
  nodes(Es,Ns),
  enumerate(Ns,Es,Nsv),
  labeling([ff],Nsv).


edges(t(_,[]),_).
edges(t(V,[t(T,Tes)|Ts]),[e(V,T) | Es]):-
  edges(t(T,Tes),TEs),
  edges(t(V,Ts),TSe),
  append(TEs,TSe,Es),!.

nodes(Es,Ns):- nodes(Es,Ns,[]).

nodes([],Ns,Ts):- sort(Ts,Ns).
nodes([e(X,Y)|Es],Ns,Ts):-
  nodes(Es,Ns,[X,Y | Ts]).

enumerate(Ns,Es,Nsv):-
  length(Ns,Nl),
  length(Nsv,Nl),
  length(Es,El),
  length(Esv,El),
  Nsv ins 1..Nl,
  Esv ins 1..El,
  valid(Ns,Es,Nsv,Esv),
  all_distinct(Nsv),
  all_distinct(Esv).

valid(_,[],_,[]).
valid(Ns,[e(X,Y)|Es],Nsv,[Ev|Esv]):-
  nth0(XI,Ns,X),
  nth0(YI,Ns,Y),
  nth0(XI,Nsv,H),
  nth0(YI,Nsv,T),
  Ev #= abs(H-T),
  valid(Ns,Es,Nsv,Esv).

