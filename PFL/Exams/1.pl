f([], 0).

f([H|T], S) :-
  f(T, S1),
  S1 > 2,
  !,
  S = S1 + H.

f([_|T], S) :-
  f(T, S1),
  S = S1 + 1.


sum(L, S) :-
  length(L, LLength),
  LLength =< 3,
  S is LLength.

sum([HL|TL], S) :-
  sum(TL, S2),
  S is S2 + HL.


% 1 2 3 4 5 => S = 5 + 1 = 6
% 2 3 4 5 => S = 3 + 2 = 5
% 3 4 5 => S = 2 + 1 = 3
% 4 5 => S = 1 + 1 = 2
% 5 => S = 0 + 1 = 1
% [] => S = 0
