first(X, [X|_]).

nth(X, [X|_], 1).
nth(X, [_|L], N) :- nth(X, L, N1), N is N1 + 1.

last(X, [X]).
last(X, [_|L]) :- last(X, L).

contains(X, [X|_]).
contains(X, [_|L]) :- contains(X, L).

cnct([], Y, Y).
cnct([XH|XL], Y, [XH|ZL]) :- cnct(XL, Y, ZL).

is_list([]).
is_list([_|_]).

preff([], X) :- is_list(X).
preff([X|L], [X|L1]) :- preff(L, L1).

suff(X, X) :- is_list(X).
suff(X, [_|L]) :- suff(X, L).

sublist(X, L) :- preff(X, L).
sublist(X, [_|L]) :- sublist(X, L).

remove(X, [X|L], L).
remove(X, [H|L], [H|L1]) :- remove(X, L, L1).

perm([], []).
perm([H|L], X) :- remove(H, X, L1), perm(L, L1).

is_sorted([]).
is_sorted([_]).
is_sorted([A, B|L]) :- A < B, is_sorted([B|L]).

bogosort(A, B) :- perm(A, B), is_sorted(A).

min(X, [X]).
min(X, [X|T]) :- min(A, T), X < A.
min(X, [H|T]) :- min(X, T), X < H.

ssort([], []).
ssort([M|S], L) :- min(M, L), remove(M, L, L1), ssort(S, L1).

partition(_, [], [], []).
partition(X, [H|T], [H|L], R) :- H < X, partition(X, T, L, R).
partition(X, [H|T], L, [H|R]) :- H >= X, partition(X, T, L, R).

qsort([], []).
qsort([S], [S]).
qsort(S, [H|T]) :- partition(H, T, L, R), qsort(LS, L), qsort(RS, R), cnct(LS, [H|RS], S).

push(X, e, t(e, X, e)).
push(X, t(L, T, R), t(L1, T, R)) :- X < T, push(X, L, L1).
push(X, t(L, T, R), t(L, T, R1)) :- X >= T, push(X, R, R1).

mt(e, []).
mt(T, [H|Q]) :- mt(T1, Q), push(H, T1, T).

t2l(e, []).
t2l(t(L, M, R), A) :- t2l(L, LL), t2l(R, RL), cnct(LL, [M|RL], A).

tsort([], []).
tsort(S, A) :- mt(T, A), t2l(T, S).

len(0, []).
len(N, [_|L]) :- len(N1, L), N is N1 + 1.
