

%      delete(List, ElementDeleted, ResultList)
% flow delete(i, o, o)


% Aleg sa sterg elementul curent (HL) din lista
delete([HL | TL], HL, TL).

% Aleg sa NU sterg elementul curent (HL) din lista
delete([HL | TL], E, [HL | TRes]) :-
  delete(TL, E, TRes).

% ==============================================================

%      var(Lista, NrElements, Res)
% flow var(i, i, o)

var(_, 0, []).

var(L, N, [DeletedEl | TRes]) :-
  delete(L, DeletedEl, Rest),
  NewN is N - 1,
  var(Rest, NewN, TRes).

varAll(L, N, RAll) :-
  findall(RAux, var(L, N, RAux), RAll).
