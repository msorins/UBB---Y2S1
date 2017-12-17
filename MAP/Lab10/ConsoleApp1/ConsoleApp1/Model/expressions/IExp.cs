using System;
using System.Collections.Generic;
using System.Text;

namespace ToyInterpreter.Model.expressions
{
    interface IExp
    {
        int eval(Dictionary<String, Int64> d);
    }
}
