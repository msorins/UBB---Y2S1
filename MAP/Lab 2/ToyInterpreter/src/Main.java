import controller.Controller;
import model.expressions.ArithExp;
import model.expressions.ConstExp;
import model.expressions.VarExp;
import model.statements.*;
import repository.Repository;
import view.View;

public class Main {
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


        View view = new View();
        view.newProgram(ex1);
        view.newProgram(ex2);
        view.newProgram(ex3);
        view.starProg();
    }

}
