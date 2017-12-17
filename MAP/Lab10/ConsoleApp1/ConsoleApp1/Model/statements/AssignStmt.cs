using ConsoleApp1.Model.state;
using ConsoleApp1.Model.statements;
using System;
using System.Collections.Generic;
using System.Text;
using ToyInterpreter.Model.expressions;

namespace ToyInterpreter.Model.statements
{
    class AssignStmt: IStmt
    {
        private String id;
        private IExp exp;

        public AssignStmt(String id, IExp exp)
        {
            this.id = id;
            this.exp = exp;
        }

        public PrgState execute(PrgState state)
        {
            Stack<IStmt> stk = state.getExeStack();
            Dictionary<String, Int64> symTbl = state.getSymTable();
            int val = exp.eval(symTbl);

            symTbl.Add(id, val);
            return state;
        }

        public override String ToString()
        {
            return id + "=" + exp.ToString();
        }  
    }
}
