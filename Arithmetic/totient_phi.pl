:- ensure_loaded(coprime).
:- arithmetic_function(totient_phi/1).

totient_phi(X,Y):- totient_phi(X,Y,1),!.

totient_phi(X,0,N):- N >= X,!.

totient_phi(X,Y,N):- 
  \+ coprime(X,N),
  N1 is N + 2,
  totient_phi(X,Y,N1).

totient_phi(X,Y,N):- 
  N1 is N + 2,
  totient_phi(X,Y1,N1),
  Y is Y1 + 1.

