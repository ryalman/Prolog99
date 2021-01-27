:-[isomorphic].

kregular(N,K,graph(Vs,Es)):-
  N > K,
  NK is N * K,
  0 is mod(NK,2),
  randset(N,N,Vs),
  distributed(N,K,Ns),!,
  generate(Ns,Es).

distributed(N,K,Ns):-distributed(N,N,K,Ns),!.

distributed(_,_,0,[]):-!.

distributed(N,0,K,Ns):-
  Kn is K - 1,
  distributed(N,N,Kn,Ns),!.

distributed(N,Nn,K,[Nn|Ns]):-
  Nnn is Nn -1,
  distributed(N,Nnn,K,Ns),!.


generate(Ns,Es):-
  append(Vs,Ts,Ns),
  length(Vs,L),length(Ts,L),!,
  generate(Vs,Ts,[],Es).


generate([],[],Ess,Ess):-!.
generate(Vs,Ts,Ess,Es):-
  select(V,Vs,Vss),!,
  select(T,Ts,Tss),
  V \= T,
  \+ adjacent(V,T,Ess),
  generate(Vss,Tss,[e(V,T) | Ess],Es).

adjacent(V,T,Es):- member(e(V,T),Es),!.
adjacent(V,T,Es):- member(e(T,V),Es).

kregs(N,K,Gss):-
  setof(G,kregular(N,K,G),Gs),
  predsort(by_iso,Gs,Gss),!.

by_iso(=,X,Y):- isomorphic(X,Y,_),!.
by_iso(<,_,_):-!.
