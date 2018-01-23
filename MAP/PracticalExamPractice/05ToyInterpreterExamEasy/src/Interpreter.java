import controller.Controller;
import model.expressions.*;
import model.statements.*;
import view.commands.*;
import view.menu.TextMenu;

public class Interpreter {
    public static void main(String[] args) throws Exception {
        IStmt ex1 = new CompStmt(new AssignStmt("v",new ConstExp(2)), new PrintStmt(new VarExp("v")));
        /*IStmt ex2 = new CompStmt(new AssignStmt("a", new ArithExp('+',new ConstExp(2),new
                ArithExp('*',new ConstExp(3), new ConstExp(5)))),
                new CompStmt(new AssignStmt("b",new ArithExp('+',new VarExp("a"), new
                        ConstExp(1))), new PrintStmt(new VarExp("b"))));

        IStmt ex3 = new CompStmt(new AssignStmt("a", new ArithExp('-',new ConstExp(2), new
                ConstExp(2))),
                new CompStmt(new IfStmt(new VarExp("a"),new AssignStmt("v",new ConstExp(2)), new
                        AssignStmt("v", new ConstExp(3))), new PrintStmt(new VarExp("v"))));

        IStmt ex4 = new CompStmt(
                new OpenRFileStmt("var_f", "/Users/so/Desktop/Y2S2/MAP/Lab 2/ToyInterpreter/files/test.in"),
                new CompStmt(
                        new ReadFileStmt(new ConstExp(0), "var_c"),
                        new PrintStmt(new VarExp("var_c"))

                )
        );

        IStmt ex5 = new CompStmt(
                new AssignStmt("v", new ConstExp(10)),
                new CompStmt(
                        new NewStmt("v", new ConstExp(20)),
                        new CompStmt(
                                new NewStmt("a", new ConstExp(22)),
                                new CompStmt(
                                        new PrintStmt(new ArithExp('+', new ConstExp(100), new rHExp("v"))),
                                        new PrintStmt(new ArithExp('+', new ConstExp(100), new rHExp("a")))
                                        )
                                )
                        )
                );

        IStmt ex6 = new CompStmt(
                new AssignStmt("v", new ConstExp(10)),
                new CompStmt(
                        new NewStmt("v", new ConstExp(20)),
                        new CompStmt(
                                new NewStmt("a", new ConstExp(22)),
                                new CompStmt(new wHStmt("a", new ConstExp(30)),
                                            new CompStmt(
                                                    new PrintStmt(new VarExp("a")),
                                                    new PrintStmt(new rHExp("a"))
                                            )
                                )
                        )
                )
        );

        IStmt ex7 = new CompStmt(
                new AssignStmt("v", new ConstExp(10)),
                new CompStmt(
                        new NewStmt("v", new ConstExp(20)),
                        new CompStmt(
                                new NewStmt("a", new ConstExp(22)),
                                new CompStmt(new wHStmt("a", new ConstExp(30)),
                                        new CompStmt(
                                                new PrintStmt(new VarExp("a")),
                                                new CompStmt(
                                                        new PrintStmt(new rHExp("a")),
                                                        new AssignStmt("a", new ConstExp(0))
                                                )
                                        )
                                )
                        )
                )
        );

        IStmt ex8 = new CompStmt(
                new AssignStmt("v", new ArithExp('+',
                        new ConstExp(10),
                        new BooleanExp("<", new ConstExp(2), new ConstExp(6)))),
                new PrintStmt(new VarExp("v"))
        );

        IStmt ex9 = new CompStmt(
                new AssignStmt("v", new ConstExp(6)),
                new CompStmt(
                        new WhileStmt(
                                new ArithExp('-', new VarExp("v"), new ConstExp(4)),
                                new AssignStmt("v", new ArithExp('-', new VarExp("v"), new ConstExp(1)))),
                        new PrintStmt(new VarExp("v"))
                )
        );*/

        IStmt ex10_fork = new CompStmt(
            new wHStmt("a", new ConstExp(30)),
            new CompStmt(
                    new AssignStmt("v", new ConstExp(32)),
                    new CompStmt(
                            new PrintStmt(new VarExp("v")),
                            new PrintStmt(new rHExp("a"))
                    )
            )
        );
        IStmt ex10 = new CompStmt(
                new AssignStmt("v", new ConstExp(10)),
                new CompStmt(
                        new NewStmt("a", new ConstExp(22)),
                        new CompStmt(
                                new ForkStmt(ex10_fork),
                                new CompStmt(
                                        new PrintStmt(new VarExp("v")),
                                        new PrintStmt(new rHExp("a"))
                                )
                        )
                )
        );


        IStmt ex11_fork = new CompStmt(
                new AssignStmt("b", new ConstExp(20)),
                new PrintStmt(new VarExp("b"))
        );

        IStmt ex11 = new CompStmt(
                new AssignStmt("a", new ConstExp(10)),
                new CompStmt(
                        new ForkStmt( ex11_fork ),
                        new PrintStmt(new VarExp("a"))
                )
        );

        Controller controller = new Controller();
        controller.addProgram(ex1);

        TextMenu menu = new TextMenu();
        menu.addCommand(new RunInputCommand("1", "Input Statement", controller));
        menu.addCommand(new PrintCommand("2", "View Programs", controller) );
        menu.addCommand(new RunOneStepCommand("3", "One step eval", controller));
        menu.addCommand(new RunAllStepsCommand("4", "All steps eval", controller));
        menu.addCommand(new ExitCommand("5", "Exit", controller));
        menu.show();
    }

}
