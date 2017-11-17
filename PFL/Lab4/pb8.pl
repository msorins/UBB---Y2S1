% inserarea elementului X in Lista L pe pozitia P
% insertAt(L - lista, X - elementul, Pos - pozitia pe care vreau sa inserez, CPos - pozitia curenta, R - rezultat )
% insertAt(i, i, i, i, o)

insertAt([], X, _, _, [X]) :-
  !.

insertAt(L, X, POS, POS, [X | L]) :-
  !.

insertAt([HL|TL], X, POS, CPOS, [HL | TR]) :-
    POS =\= CPOS,
    CPOS2 is CPOS + 1,
    insertAt(TL, X, POS, CPOS2, TR).

insertAtWrap(L, X, POS, R) :-
    insertAt(L, X, POS, 1, R).


insertAll(L, X, CPOS, R) :-
    insertAtWrap(L, X, CPOS, R).

insertAll(L, X, CPOS, R) :-
    length(L, LenL),
    CPOS =< LenL,
    CPOS2 is CPOS + 1,
    insertAll(L, X, CPOS2, R).

insertAllWrapA(L, X, RFinal) :-
    findall(RPart, insertAll(L, X, 1, RPart), RFinal).

insertAllWrap(L, X, R) :-
      insertAll(L, X, 1, R).

% perm(L - list , CrtR - aux variable, initial [], FinR - result variable )
% perm flow(i, i, o)

perm([], R, FinR) :-
  validp_wrap(R, ROut),
  ROut =:= 1,
  FinR = R,
  !.

perm([HL | TL], CrtR, FinR) :-
  insertAllWrap(CrtR, HL, AuxR),
  perm(TL, AuxR, FinR).

permWrapA(L, RFinal) :-
  findall(RAux, perm(L, [], RAux), RFinal).


% gen X char N times
% gen(X - character to be repeated, N - number of times, R - aux res, ResF - final result)
% gen flow(i, i, i, o)

gen(_, N, R, R) :-
  length(R, LenR),
  N =:= LenR.

gen(X, N, R, ResF) :-
  length(R, LenR),
  N =\= LenR,
  gen(X, N, [X | R], ResF).

gen_wrap(X, N, R) :-
  gen(X, N, [], R).

% validp -> return 1 if a paranthesis is valid, 0 otherwise
% validp( L - list of paranthesis, OpenP - number of current opened paranthesis, R - result)
% validp flow(i, i, o)

validp([], 0, 1).

validp([], _, 0) :-
  !.

validp(L, OpenP, 0) :-
  OpenP < 0,
  !.

validp(['(' | TL], OpenP, R) :-
    NewOpenP is OpenP + 1,
    validp(TL, NewOpenP, R).

validp([')' | TL], OpenP, R) :-
    NewOpenP is OpenP - 1,
    validp(TL, NewOpenP, R).

validp_wrap(L, R) :-
  validp(L, 0, R).

validp_wrapA(L, RFin) :-
  findall(RAux, validp_wrap(L, RAux), RFin).

% samel -> check if two lists are the same
% samel(A - first list, B - second list, R - result)
% samel flow(i, i, o)

samel(A, B, 0) :-
  length(A, LenA),
  length(B, LenB),
  LenA =\= LenB.

samel([], [], 1).

samel([HA | TA], [HB | TB], 0) :-
    HA \= HB.

samel([HA | TA], [HA | TB], R) :-
    samel(TA, TB, R).


% inl -> check if a list X is present into another list of lists L
% inL(L - list of lists, X - list to be compared, R - Result)
% inL(i, i, o)

inL([], _, 0).

inL([HL | TL], X, 1) :-
    samel(HL, X, IsSame),
    IsSame =:= 1.

inL([HL | TL], X, R) :-
    samel(HL, X, IsSame),
    IsSame =:= 0,
    inL(TL, X, R).


% remdup -> removes duplicates from a given list
% remdup(L - list to remove the duplicates, R - result)
% remdup flow(i, o)

remdup([], []).

remdup([HL | TL], [HL | TR]) :-
    inL(TL, HL, IsIn),
    IsIn =:= 0,
    remdup(TL, TR).

remdup([HL | TL], R) :-
    inL(TL, HL, IsIn),
    IsIn =:= 1,
    remdup(TL, R).


% main of problem 8
pb8_main(N, Res) :-
  Np is N div 2,
  gen_wrap('(',  Np, P1 ),
  gen_wrap(')',  Np, P2 ),
  append(P1, P2, P3),
  permWrapA(P3, ResAll),
  remdup(ResAll, Res).

pb8_test() :-
  pb8_main(2, [['(', ')']]),
  pb8_main(4, [['(', ')', '(', ')'], ['(', '(', ')', ')']] ),
  pb8_main(6, [['(', ')', '(', ')', '(', ')'], ['(', '(', ')', ')', '(', ')'], ['(', ')', '(', '(', ')', ')'], ['(', '(', ')', '(', ')', ')'], ['(', '(', '(', ')', ')', ')']] ).
