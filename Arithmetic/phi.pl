:- arithmetic_function(phi/1).
:- ensure_loaded(prime_factors_mult).

phi(X,Y):-
  prime_factors_mult(X,Ps),
  phi_reduce(Ps,Y).

phi_reduce([],1).
phi_reduce([[P,M]|Ps],Y):-
  phi_reduce(Ps,YN),
  Y is YN * ((P-1)* (P ** (M - 1))).
