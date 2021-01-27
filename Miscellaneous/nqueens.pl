
nqueens(N,Qs):- nqueens(N,1,[],Qs).

nqueens(N,Col,Qss,Qss):-Col > N,!.
nqueens(N,Col,Qss,Qs):-
  between(1,N,Row),
  \+ member(Row,Qss),
  \+ diagonal(Col,Row,Qss),
  Coln is Col + 1,
  nqueens(N,Coln,[Row|Qss],Qs).


diagonal(Col,Row,[R | Rs]):-
  length([R|Rs],C),
  Cd is Col - C,
  Rd is Row - R,
  abs(Cd,Cda),
  abs(Rd,Rda),
  Cda = Rda,!.

diagonal(Col,Row,[_|Rs]):- diagonal(Col,Row,Rs).

all_nqueens(N,Qs):- setof(Qs,nqueens(N,Qs),Qss),length(Qss,Qs).
