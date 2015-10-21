n(1).
n(N) :- n(N1), N is N1 + 1.

between(A, A, B) :- A =< B.
between(A, X, B) :- A < B, A1 is A + 1, between(A1, X, B).

pitagor(A, B, C) :- n(N), 
                    between(1, A, N),
                    between(A, B, N),
                    between(B, C, N),
                    C2 is C*C,
                    C2 is A*A + B*B.

fib(1, 1).
fib(1, 2).
fib(F, N) :- N > 2,
             N2 is N - 2,
             N1 is N - 1,
             fib(F2, N2),
             fib(F1, N1),
             F is F1 + F2.

fib(F) :- n(N), fib(F, N).

spl(X, [X]).
spl(L, [A|R]) :- cnct(A, B, L), A \= [], B \= [], spl(B, R).

list1([1]).
list1([1|L]) :- list1(L).

sum_list(X, L) :- len(N, L), N =< X.

%sum_spl(X, L) :- 
