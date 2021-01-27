/*
 */

combination(_,[],[]).
combination(1,[X|_],[X]).
combination(N,[X|Xs],[X|Ys]):- N > 1, N1 is N - 1, combination(N1,Xs,Ys).
combination(N,[_|Xs],Ys):- length(Xs,L), L >= N, combination(N,Xs,Ys).


% bagof(X,combination(3,[a,b,c,d,e,f,g,h,i,j,k,l],X),Xs), length(Xs,N).
% ....
% N = 220.
