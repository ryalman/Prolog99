
full_words(N,W):- atom_chars(N,Ns), words(Ns,Ws), atomic_list_concat(Ws,W).

words([],[]).
words([X],[W]):-word(X,W),!.
words([N|Ns],[W,- | Ws]):- word(N,W), words(Ns,Ws).

word('0',"Zero").
word('1',"One").
word('2',"Two").
word('3',"Three").
word('4',"Four").
word('5',"Five").
word('6',"Six").
word('7',"Seven").
word('8',"Eight").
word('9',"Nine").
