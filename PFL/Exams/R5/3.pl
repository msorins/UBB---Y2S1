% Lista submultimiilor care au suma S

%      comb(Lst, R, RF)
% flow comb(i, i, o)

comb([], R, R).

comb([_ | TL], R, RF) :-
  comb(TL, R, RF).

comb([HL | TL], R, RF) :-
  append(R, [HL], RNew),
  comb(TL, RNew, RF).

combAll(L, RAll) :-
  findall(RAux, comb(L, [], RAux), RAll).

% ================================

%       sumListA(Lst, Res)
%  flow sumListA(i, o)

sumListA([], 0).

sumListA([HL | TL], R) :-
  sumListA(TL, RRec),
  R is RRec + HL.


%      sumListB(Lst, RAux, RFinal)
% flow sumListB(i, i, o)

sumListB([], R, R).

sumListB([HL | TL], RAux, RFinal) :-
  NewRAux is RAux + HL,
  sumListB(TL, NewRAux, RFinal).

% ================================

%      filter(Lst, S, Res)
% flow filter(i, i, o)

filter([], _, []).

filter([HL | TL], S, [HL | TRes]) :-
  sumListA(HL, S),
  filter(TL, S, TRes).

filter([HL | TL], S, Res) :-
  sumListA(HL, SRes),
  SRes =\= S,
  filter(TL, S, Res).

% ================================

main(L, S, R) :-
  combAll(L, RComb),
  filter(RComb, S, R),
  printlist(R).




printlist([]).

printlist([X|List]) :-
  write(X),nl,
  printlist(List).
