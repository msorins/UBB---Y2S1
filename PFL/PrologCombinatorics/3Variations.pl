%      perm(L, R)
% flow perm(i, o)

perm([],[]).

perm(List,[H|Perm]) :-
  delete(List, H, Rest),
  perm(Rest,Perm).


%      delete(List, FirstElem, Res)
% flow delete(i, o, o)

delete([X|T], X, T).

delete([H|T], X, [H|TRes]) :-
  delete(T, X, TRes).


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

% Compute Perm
computePerm(L, ResAll) :-
  findall(ResAux, perm(L, ResAux), ResAll).

% Compute comb
computeComb(L, K, RAll) :-
  length(L, N),
  findall(RAux, comb(L, N, K, [], RAux), RAll).

% Compute loop through all combinations
computeLoop([], R, R).

computeLoop([HL|TL], R, RFinal) :-
  computePerm(HL, ResHL),
  append(R, ResHL, RNew),
  computeLoop(TL, RNew, RFinal).

% Compute main
compute(L, K, RAll) :-
  computeComb(L, K, ResComb),
  computeLoop(ResComb, [], RAll),
  printlist(RAll).

printlist([]).

printlist([X|List]) :-
  write(X),nl,
  printlist(List).
