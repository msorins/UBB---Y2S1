using ConsoleApp1.Model.state;
using ConsoleApp1.Model.statements;
using System;
using System.Collections.Generic;
using System.Text;
using ToyInterpreter.Model.expressions;

namespace ToyInterpreter.Model.statements
{
    class IfStmt: IStmt
    {
        private IExp exp;
        private IStmt thenS;
        private IStmt elseS;

        //Constructor
        public IfStmt(IExp e, IStmt t, IStmt el)
        {
            exp = e;
            thenS = t;
            elseS = el;
        }

        public PrgState execute(PrgState state)
        {
            Stack<IStmt> exeStack = state.getExeStack();

            if(exp.eval(state.getSymTable()) == 1 ) {
                exeStack.Push(thenS);
            } else {
                exeStack.Push(elseS);
            }

            return state;
        }

 
        public override String ToString()
        {
            return "IF(" + exp.ToString() + ") THEN(" + thenS.ToString() + ")ELSE(" + elseS.ToString() + ")";
        }
    }
}
