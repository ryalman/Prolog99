:- use_module(library(clpfd)).

nonogram(Rows,Cols,Sol):-
  same_length(Rows,Sol),
  maplist(same_length(Cols),Sol),
  maplist(maplist(in_range(0,1)),Sol),
  transpose(Sol,TSol),
  append(Sol,TSol,Lines),
  append(Rows,Cols,Cons),
  maplist(solve,Lines,Cons),
  flatten(Lines,Vars),
  labeling([ffc],Vars),
  maplist(portray_clause,Sol),!.


solve(Line,Cons):-
  automat(Cons,start,Final,Arcs),
  automaton(Line,[source(start),sink(Final)],[arc(start,0,start)|Arcs]).

/**
 * Copyright Note: The idea of automaton is inspired from Lars Buitinck's
 * Solution on https://rosettacode.org/wiki/Nonogram_solver#Prolog as well as
 * from the example of two_consecutive_ones on
 * https://www.swi-prolog.org/pldoc/doc_for?object=automaton/3
 */

automat([0],Final,Final,[arc(Final,0,Final)]):-  reset_gensym,!.
automat([0|Cs],Start,Final,[arc(Start,0,Start),arc(Start,0,Next)|Arcs]):-
  gensym(Start,Next),
  automat(Cs,Next,Final,Arcs),!.

automat([C|Cs],Start,Final,[arc(Start,1,Next) | Arcs]):-
  Cn #= C - 1,
  gensym(Start,Next),
  automat([Cn|Cs],Next,Final,Arcs).

in_range(S,T,V):- V in S..T.
