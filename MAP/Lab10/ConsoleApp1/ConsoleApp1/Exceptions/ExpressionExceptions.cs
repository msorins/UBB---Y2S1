using System;
using System.Collections.Generic;
using System.Text;

namespace ToyInterpreter.Model.expressions
{
    class ExpressionExceptions: Exception
    {
        private string v;

        public ExpressionExceptions(string msg): base(msg)
        {
            this.v = msg;
        }
    }
}
