/*
 */


:- ensure_loaded(range).
:- ensure_loaded(rnd_select).
:- ensure_loaded(remove_at).

lotto(S,T,Y):- range(1,T,U), rnd_select(U,S,Y).
