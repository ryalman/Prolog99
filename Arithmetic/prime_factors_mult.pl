
:- ensure_loaded("../PrologLists/encode.pl").
:- ensure_loaded("prime_factors.pl").

prime_factors_mult(N,Ls):- 
  prime_factors(N,X),
  encode(X,Es),
  maplist(reverse,Es,Ls),!.

reverse([X,Y],[Y,X]).
