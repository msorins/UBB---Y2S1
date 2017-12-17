using ConsoleApp1.Model.statements;
using System;
using ToyInterpreter.Controller;
using ToyInterpreter.Model.expressions;
using ToyInterpreter.Model.state;
using ToyInterpreter.Model.statements;
using ToyInterpreter.View.commands;
using ToyInterpreter.View.menu;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            IStmt ex1 = new CompStmt(new AssignStmt("v", new ConstExp(2)), new PrintStmt(new VarExp("v")));
            IStmt ex3 = new CompStmt(new AssignStmt("a", new ArithExp('-', new ConstExp(2), new
                ConstExp(2))),
                new CompStmt(new IfStmt(new VarExp("a"), new AssignStmt("v", new ConstExp(2)), new
                        AssignStmt("v", new ConstExp(3))), new PrintStmt(new VarExp("v"))));

            IStmt ex4 = new CompStmt(
                new OpenRFileStmt("var_f", "testin.txt"),
                new CompStmt(
                        new ReadFileStmt(new ConstExp(0), "var_c"),
                        new PrintStmt(new VarExp("var_c"))
                )
            );

            IStmt ex5 = new CompStmt(
                new OpenRFileStmt("var_f", "testin.txt"),
                new CompStmt(
                        new ReadFileStmt(new ConstExp(0), "var_c"),
                        new CompStmt(
                            new ReadFileStmt(new ConstExp(0), "var_d"),
                            new CompStmt(
                                 new AssignStmt("res", new ArithExp('+', new VarExp("var_c"), new VarExp("var_d"))),
                                 new PrintStmt(new VarExp("res"))
                                )
                        )
                )
            );

            Controller controller = new Controller();
            controller.addProgram(ex5);

            TextMenu menu = new TextMenu();
            menu.addCommand(new RunInputCommand("1", "Input Statement", controller));
            menu.addCommand(new PrintCommand("2", "View Programs", controller));
            menu.addCommand(new RunOneStepCommand("3", "One step eval", controller));
            menu.addCommand(new RunAllStepsCommand("4", "All steps eval", controller));
            menu.addCommand(new ExitCommand("5", "Exit", controller));
            menu.show();

            Console.ReadLine();
        }
    }
}
