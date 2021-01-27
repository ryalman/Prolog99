/*
 */

:- ensure_loaded(rnd_select).

rnd_permu(X,Y):- length(X,N),rnd_select(X,N,Y).
