import controller.Controller;
import model.expressions.ArithExp;
import model.expressions.ConstExp;
import model.expressions.VarExp;
import model.statements.*;
import repository.Repository;
import view.View;
import view.commands.*;
import view.menu.TextMenu;

public class Interpreter {
    public static void main(String[] args) throws Exception {
        IStmt ex1 = new CompStmt(new AssignStmt("v",new ConstExp(2)), new PrintStmt(new VarExp("v")));
        IStmt ex2 = new CompStmt(new AssignStmt("a", new ArithExp('+',new ConstExp(2),new
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

        Controller controller = new Controller();
        controller.newProgram(ex1);
        controller.newProgram(ex2);
        controller.newProgram(ex3);
        controller.newProgram(ex4);

        TextMenu menu = new TextMenu();
        menu.addCommand(new RunInputCommand("1", "Input Statement", controller));
        menu.addCommand(new PrintCommand("2", "View Programs", controller) );
        menu.addCommand(new RunOneStepCommand("3", "One step eval", controller));
        menu.addCommand(new RunAllStepsCommand("4", "All steps eval", controller));
        menu.addCommand(new ExitCommand("5", "Exit", controller));
        menu.show();
    }

}
