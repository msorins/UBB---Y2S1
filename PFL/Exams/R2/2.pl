% transformare lista in set

%      notIn(Lista, Element, Res) => Res is 1 or 0
% flow notIn(i, i, o)
notIn([], _, 1).

notIn([HL | _], HL, 0) .

notIn([HL | TL], E, R) :-
  E =\= HL,
  notIn(TL, E, R).

% =======================================
%      transformA(Lista, Result)
% flow transformA(i, o)

transformA([], []).

transformA([HL | TL], [HL | TR]) :-
  transformA(TL, TR),
  notIn(TR, HL, 1).

transformA([HL | TL], R) :-
  transformA(TL, R),
  notIn(R, HL, 0).

% =======================================
%      transofmrB(Lista, ResAux, ResultFinal)
%      flow(i, i, o)

transformB([], R, R).

transformB([HL | TL], R, ResF) :-
  notIn(R, HL, 1),
  transformB(TL, [HL | R], ResF).

transformB([HL | TL], R, ResF) :-
  notIn(R, HL, 0),
  transformB(TL, R, ResF).
