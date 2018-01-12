% Eliminate first n numbers from a list

% eliminate(List, N, Res)

eliminate([], N, []) :-
  N >= 0.

eliminate(L, 0, L).

eliminate([_ | TL], N, R) :-
  N > 0,
  NewN is N - 1,
  eliminate(TL, NewN, R).
