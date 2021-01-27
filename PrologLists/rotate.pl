/*
 */


rotate([],_,[]).
rotate(Xs,N, Ys):- N > 0, head_tail(Xs,Hs,Ts,N), append(Ts,Hs,Ys).
rotate(Xs,N, Ys):- N < 0, length(Xs,K), L is K + N, rotate(Xs,L,Ys).

head_tail([],[],[],_).
head_tail(Xs,[],Xs,0).
head_tail([X|Xs],[X|Hs],Ts, N):- N > 0, K is N - 1, head_tail(Xs,Hs,Ts,K).


 
% I forgot to use split but using it makes the solution easier
%
%:- [split].
% rotate([],_,[]) :- !.
% rotate(L1,N,L2) :-
%   length(L1,NL1), N1 is N mod NL1, split(L1,N1,S1,S2), append(S2,S1,L2).



