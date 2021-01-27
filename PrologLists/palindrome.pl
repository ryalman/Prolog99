/*
 * A list is a palindrome if it is the same as its reverse.
 */

:-[reverse].

palindrome(Xs):- reverse(Xs,Xs).


