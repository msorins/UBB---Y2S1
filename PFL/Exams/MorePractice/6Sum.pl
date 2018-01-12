sm([], 0).

sm([HL | TL], R) :-
  !,
  HL MOD 2 =:= 1,
  sum(TL, R1),
  R is R1 + HL.

sum([HL | TL], R) :-
  sum(TL, R1),
  R is R1.
  
