comb(_, 0, []).

comb([HL | TL], N, [HL | TRes]) :-
  N > 0,
  NewN is N - 1,
  comb(TL, NewN, TRes).

comb([_ | TL], N, Res) :-
  N > 0,
  comb(TL, N, Res).

combAll(L, N, ResAll) :-
  findall(ResAux, comb(L, N, ResAux), ResAll).
