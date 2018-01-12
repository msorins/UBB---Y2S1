% doua implementari pentru calcularea lui x^n

% putereA(X, N, Res)
% flow putereA(i, i, o)

putereA(_, 0, 1).

putereA(X, N, R) :-
  NewN is N - 1,
  putereA(X, NewN, RRec),
  R is RRec * X.


%      putereB(X, N, ResCrt, ResFinal)
% flow putereB(i, i, i, o)

putereB(_, 0, R, R).

putereB(X, N, RCrt, RFinal) :-
  NewN is N - 1,
  NewRCrt is RCrt * X,
  putereB(X, NewN, NewRCrt, RFinal).

putereBMain(X, N, R) :-
  putereB(X, N, 1, R).
