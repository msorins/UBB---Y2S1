% The algorithm should return the difference of all the numbers

f([], 0).

f([H|T], S) :-
  f(T, S1),
  S is S1 - H.
