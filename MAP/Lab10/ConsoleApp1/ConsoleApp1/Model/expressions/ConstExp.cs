using System;
using System.Collections.Generic;
using System.Text;

namespace ToyInterpreter.Model.expressions
{
    class ConstExp : IExp
    {
        private int value;

        public ConstExp(int value)
        {
            this.value = value;
        }

        public int eval(Dictionary<String, Int64> d)
        {
            return this.value;
        }
  
        public override String ToString()
        {
            return " " + value;
        }
    }
}
