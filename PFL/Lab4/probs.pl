% Delete all apparitions of X in a given list
% dlt(X, ListInput, ListOutput)
% dlt_flow(i, i, o)

dlt(_, [], []).

dlt(X, [HA | TA], [HB | TB]) :-
  X =\= HA,
  dlt(X, TA, TB),
  HB is HA.

dlt(X, [HA | TA], B) :-
  X =:= HA,
  dlt(X, TA, B).


% Delete all apparitions of X in a given list with accumulator
% dltAC(X, ListInput, ListOutput)
% dltAC_flow(i, i, o)

dltAC(_, [], R, R).

dltAC(X, [HL | TL], R , ROut) :-
  X =\= HL,
  append(R, [HL], R2),
  dltAC(X, TL, R2, ROut).

dltAC(X, [HL | TL], R, ROut) :-
  X =:= HL,
  dltAC(X, TL, R, ROut).


% Delete first apparition of element X in a given ListInput
% delFirst(X - element, L - List, R - res)
% delFirst(i, i, o)

delFirst(_, [], []).

delFirst(X, [HL|TL], [HL|TR]) :-
  X =\= HL,
  delFirst(X, TL, TR).

delFirst(X, [X|TL], TL).
