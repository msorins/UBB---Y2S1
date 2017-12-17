using ConsoleApp1.Model.statements;
using System;
using System.Collections.Generic;
using System.Text;
using ToyInterpreter.Model.expressions;
using ToyInterpreter.Model.statements;

namespace ToyInterpreter.View.commands
{
    class RunInputCommand: Command
    {
        public RunInputCommand(String key, String description, Controller.Controller controller): base(key, description, controller)
        {
        
        }


        public override void execute()
        {
            controller.addProgram(inputStatement());
        }

        private IStmt inputStatement()
        {
            int statementNr = getStatementNr();

            switch (statementNr)
            {
                case (1):
                    //Assign statement
                    return new AssignStmt(
                            getInputString("Variable name"),
                            inputExpression());
                case (2):
                    //Comp
                    return new CompStmt(
                            inputStatement(),
                            inputStatement()
                    );
                case (3):
                    //If
                    return new IfStmt(
                            inputExpression(),
                            inputStatement(),
                            inputStatement()
                    );
                case (4):
                    //Print
                    return new PrintStmt(
                            inputExpression()
                    );
            }
            return null;
        }

        private IExp inputExpression()
        {
            int expressionNR = getExpressionNr();

            switch (expressionNR)
            {
                case (1):
                    //Constant
                    return new ConstExp(Int32.Parse(getInputString("Constant: ")));
                case (2):
                    //Variable
                    return new VarExp(getInputString("Variable name: "));
                case (3):
                    //Arithmetic
                    IExp left = inputExpression();
                    char[] op = getInputString("Operator: ").ToCharArray();
                    IExp right = inputExpression();
                    return new ArithExp(
                            op[0],
                            left,
                            right
                    );
            }
            return null;
        }

        private int getStatementNr()
        {
            String outS;

            outS = "1. Assign \n";
            outS += "2. Comp \n";
            outS += "3. If \n";
            outS += "4. Print \n";

            Console.WriteLine(outS);

            int command = Int32.Parse(getInputString("CMD: "));

            if (command >= 1 && command <= 4)
                return command;

            return 0;
        }

        private int getExpressionNr()
        {
            String outS;

            outS = "1. Constant \n";
            outS += "2. Variable \n";
            outS += "3. Arithmetic \n";

            Console.WriteLine(outS);
            int command = Int32.Parse(getInputString("CMD: "));

            if (command >= 1 && command <= 3)
                return command;

            return 0;
        }

        private String getInputString(String msg)
        {
             return Console.ReadLine();
        }
    }
}
