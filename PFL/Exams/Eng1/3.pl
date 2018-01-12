% Generate subsets of N elements from a List

%      gen(List, N, Res)
% flow gen(i, i, o)

gen(_, 0, []).

gen([HL | TL], N, [HL | TRes]) :-
  N > 0,
  NewN is N - 1,
  gen(TL, NewN, TRes).

gen([_ | TL], N, Res) :-
  N > 0,
  gen(TL, N, Res).

genAll(L, N, ResAll) :-
  findall(ResAux, gen(L, N, ResAux), ResAll).
