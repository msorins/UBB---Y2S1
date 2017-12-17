using System;
using System.Collections.Generic;
using System.Text;

namespace ToyInterpreter.Model.expressions
{
    class VarExp: IExp
    {
        private String expr;

        public VarExp(String expr)
        {
            this.expr = expr;
        }

        public int eval(Dictionary<String, Int64> d)
        {
           if(d.ContainsKey(expr))
               return (int) d[key: expr];

           throw new Exception("Variable not found");
        }
  
        public override String ToString()
        {
            return this.expr.ToString();
        }
    }
}
