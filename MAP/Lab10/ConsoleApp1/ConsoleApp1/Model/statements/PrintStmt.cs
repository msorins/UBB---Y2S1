using ConsoleApp1.Model.state;
using ConsoleApp1.Model.statements;
using System;
using System.Collections.Generic;
using System.Text;
using ToyInterpreter.Model.expressions;

namespace ToyInterpreter.Model.statements
{
    class PrintStmt: IStmt
    {
        private IExp exp;

        public PrintStmt(IExp exp)
        {
            this.exp = exp;
        }

        public PrgState execute(PrgState state)
        {
            List<Int64> printState = state.getOut();
            printState.Add( exp.eval(state.getSymTable()) );

           return state;
        }

        public override String ToString()
        {
            return "print(" + exp.ToString() + ")";
        }

}
}
