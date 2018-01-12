%      comb(L, N, K, R) - List, N, K, Result
% flow comb(i, i, i, o)

comb(_, _, K, R, R) :-
  length(R, RLength),
  RLength =:= K.

comb([HL|TL], N, K, R, RFinal) :-
  length(R, RLength),
  RLength < K,
  append(R, [HL], RNew),
  comb(TL, N, K, RNew, RFinal).

comb([_|TL], N, K, R, RFinal) :-
  length(R, RLength),
  RLength < K,
  comb(TL, N, K, R, RFinal).

compute(L, K, RAll) :-
  length(L, N),
  findall(RAux, comb(L, N, K, [], RAux), RAll).
