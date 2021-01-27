:- [readfile].
:- [sort].
:- use_module(library(clpfd)).

crossword(File,Sol):-
  read_lines(File,Lines),
  parse_lines(Lines,Words,Dots),
  framework(Dots,Fm,Sol),
  lfsort(Words,Sl),
  lfsort(Fm,SFm),
  solve_(SFm,Sl),
  maplist(portray_clause,Sol).


parse_lines([[]|Ls],[],Ls).
parse_lines([L|Ls],[L|Ws],Fs):- parse_lines(Ls,Ws,Fs).


framework(Dots,Fm,RFm):-
  same_length(Dots,RFm),
  maplist(length,Dots,Dls),
  max_list(Dls,M),
  maplist(row(M),Dots,RFm),
  transpose(RFm,CFm),
  append(RFm,CFm,RCFm),
  maplist(words,RCFm,WFm),
  append(WFm,EFm),
  include(is_word,EFm,Fm).

% create rectangle, ' ' as dumy.
row(0,[],[]):-!.
row(M,[],[' '|Fs]):- Mn #= M - 1, row(Mn,[],Fs),!.
row(M,[' '|Ds],[' '|Fs]):- Mn #= M-1, row(Mn,Ds,Fs),!.
row(M,[.|Ds],[_|Fs]):- Mn #= M-1,row(Mn,Ds,Fs),!.

words(X,W):- split(X,S), include(is_word,S,W).

% split by var / nonvar '').
split([],[]):-!.
split([X],[]):-nonvar(X),!.
split([X],[[X]]):-var(X),!.
split([X, Y |Xs ],Ys):- nonvar(X),nonvar(Y), split(Xs,Ys),!.
split([X, Y | Xs],[[]|Ys]):- nonvar(X),var(Y), split([Y|Xs],Ys),!.
split([X, Y | Xs],[[X]|Ys]):-var(X),nonvar(Y), split(Xs,Ys),!.
split([X,Y|Xs],[[X|Ws]|Ys]):- var(X),var(Y),split([Y|Xs],[Ws|Ys]),!.


is_word(X):- length(X,Lx), Lx > 1.

solve(_,[]).
solve([X|Xs],[Y|Ys]):- solve_(X,Y), solve(Xs,Ys).

solve_(_,[]).
solve_(Fs,[L|Ls]):- 
  select(F,Fs,FRs),
  fits(F,L),
  solve_(FRs,Ls).

% using ' ' as constraint.
fits([],[]).
fits([X|Fs],[X|Ls]):- fits(Fs,Ls).

% Tests
%:- writeln("Solution For a").
%:- writeln("-------------------------------").
%:- crossword('./p7_09a.dat',_).
%
%:- writeln("Solution For b").
%:- writeln("-------------------------------").
%:- crossword('./p7_09b.dat',_).
%
%:- writeln("Solution For c").
%:- writeln("-------------------------------").
%:- crossword('./p7_09c.dat',_).
%:- writeln("Done!").
%
%:- writeln("Solution For d").
%:- writeln("-------------------------------").
%:- crossword('./p7_09d.dat',_).
%:- writeln("Done!").
