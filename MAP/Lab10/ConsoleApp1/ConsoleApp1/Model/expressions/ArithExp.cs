using System;
using System.Collections.Generic;
using System.Text;

namespace ToyInterpreter.Model.expressions
{
    class ArithExp : IExp
    {
        private IExp leftSide, rightSide;
        private char op;

        public ArithExp(char op, IExp leftSide, IExp rightSide)
        {
            this.op = op;
            this.leftSide = leftSide;
            this.rightSide = rightSide;
        }


        public int eval(Dictionary<String, Int64> d)
        {
            int evalLeft  = this.leftSide.eval(d);
            int evalRight = this.rightSide.eval(d);

            switch (op) {
                case('+'):
                    return evalLeft + evalRight;
                case('-'):
                    return evalLeft - evalRight;
                case('*'):
                    return evalLeft* evalRight;
                case('/'):
                    if(evalRight == 0)
                        throw new ExpressionExceptions("Division by 0");

                    return evalLeft / evalRight;
            }

            throw new Exception("Invalid operator");
        }


        public override String ToString()
        {
            return leftSide.ToString() + " " + op +" " + rightSide.ToString();
        }

    }
}
