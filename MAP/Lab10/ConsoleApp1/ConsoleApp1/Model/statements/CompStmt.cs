using ConsoleApp1.Model.state;
using ConsoleApp1.Model.statements;
using System;
using System.Collections.Generic;
using System.Text;

namespace ToyInterpreter.Model.statements
{
    class CompStmt: IStmt
    {
        private IStmt first;
        private IStmt second;

        public CompStmt(IStmt first, IStmt second)
        {
            this.first = first;
            this.second = second;
        }

        public PrgState execute(PrgState state)
        {
            Stack<IStmt> exeStack = state.getExeStack();
            exeStack.Push(second);
            exeStack.Push(first);

            return state;
        }

        public override String ToString()
        {
            return "(" + first.ToString() + ";" + second.ToString() + ")";
        }
    }
}
