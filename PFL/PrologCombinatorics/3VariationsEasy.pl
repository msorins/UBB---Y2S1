%      varia(List, K, Res)
% flow varia(i, i, o)

varia(_, 0, []).

varia(L, K, [HRes|TRes]) :-
  delete(L, HRes, Rest),
  KNew is K - 1,
  varia(Rest, KNew, TRes).

%      delete(List, FirstElem, Res)
% flow delete(i, o, o)

delete([X|T], X, T).

delete([H|T], X, [H|TRes]) :-
  delete(T, X, TRes).

compute(L, K, ResAll) :-
  findall(ResAux, varia(L, K, ResAux), ResAll).
