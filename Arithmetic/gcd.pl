
gcd(X,0,X):-!.
gcd(0,X,X):-!.
gcd(X,Y,G):- X > Y, X1 is rem(X,Y), gcd(X1,Y,G),!.
gcd(X,Y,G):- Y1 is rem(Y,X), gcd(X,Y1,G),!.
