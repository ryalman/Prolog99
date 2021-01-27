/*
 */

insert_at(X,[],_,[X]). 
insert_at(X,Ys,1,[X|Ys]).
insert_at(X,[Y|Ys],N,[Y|Zs]):- N > 1, K is N - 1, insert_at(X,Ys,K,Zs).

/* 
 * The official solution uses remove_at predicate from the problem 1.20.
 * In prolog, predicates works both ways. 
 * If insert_at(X,Ys,K,Z) holds then remove_at(_,Z,K,Ys) holds.
 * I think it is one of the most important difference between logic programming 
 * and functional programming. If y = f(x) then x = f ^-1 (y). 
 * In logic programming we only need to define f(x) and f ^-1(y) will be for 
 * free.
 */

% [remove_at].
% insert_at(X,Ys,K,Z) :- remove_at(_,Z,K,Ys).
