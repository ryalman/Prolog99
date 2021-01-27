

ipl(Tree,IPL):-ipl(Tree,0,IPL).

ipl(t(_,[]),D,D).
ipl(t(_,Ts),D,TD):-
  Dn is D + 1,
  ipl(Ts,Dn,TDn),
  TD is TDn + D,!.


ipl([],_,0).
ipl([T|Ts],D,TD):-
  ipl(T,D,TDn),
  ipl(Ts,D,TDs),
  TD is TDn+TDs,!.
