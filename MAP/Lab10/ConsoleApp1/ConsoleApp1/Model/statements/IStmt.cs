using ConsoleApp1.Model.state;
using System;
using System.Collections.Generic;
using System.Text;

namespace ConsoleApp1.Model.statements
{
    interface IStmt
    {
        PrgState execute(PrgState state);
    }
}
