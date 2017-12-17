using System;
using System.Collections.Generic;
using System.Text;

namespace ToyInterpreter.Exceptions
{
    class StmtExecException: Exception
    {
        private string v;

        public StmtExecException(string msg): base(msg)
        {
            this.v = msg;
        }
    }
}
