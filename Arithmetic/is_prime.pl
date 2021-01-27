/*
 */

is_prime(2):-!.
is_prime(3):-!.

is_prime(N):- is_prime(N,2),!.

is_prime(N,K):- K >= N,!.

is_prime(N,K):- K > 1, \+ 0 is rem(N,K), next_(K,K1), is_prime(N, K1),!.

next_(2,3):-!.
next_(K,N):- N is K + 2,!.
