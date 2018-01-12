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

compute(L, ResAll) :-
  findall(ResAux, perm(L, ResAux), ResAll).
