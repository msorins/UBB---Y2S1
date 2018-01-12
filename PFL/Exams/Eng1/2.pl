% Reverse a list (also the sublists it contain)

%      rv(List, Res)
% flow rv(i, o)

rv([], []).

rv([HL | TL], Res) :-
  is_list(HL),
  rv(TL, ResRec),
  rv(HL, HLRev),
  append(ResRec, [HLRev], Res).

rv([HL | TL], Res) :-
  rv(TL, ResRec),
  append(ResRec, [HL], Res).
