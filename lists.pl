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

srt(A, B) :- perm(A, B), is_sorted(A).

len(0, []).
len(N, [_|L]) :- len(N1, L), N is N1 + 1.
