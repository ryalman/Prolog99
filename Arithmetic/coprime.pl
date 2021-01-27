:- ensure_loaded(gcd).

coprime(X,Y):- gcd(X,Y,G), G = 1.
