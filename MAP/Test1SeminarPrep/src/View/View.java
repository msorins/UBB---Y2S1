package View;
import Controller.Controller;
import Model.Expr.ConjunctionExpr;
import Model.Expr.ConstantExpr;
import Model.Expr.DisjunctionExpr;
import Model.Expr.NegationStmt;

public class View {

    public static void main(String[] args) {
        Controller controller = new Controller();

        controller.add_expr(new ConjunctionExpr(new ConstantExpr(true), new ConstantExpr(true)));
        controller.add_expr(new ConjunctionExpr(new ConstantExpr(true), new ConstantExpr(false)));
        controller.add_expr(new ConjunctionExpr(new ConstantExpr(false), new ConstantExpr(false)));

        controller.add_expr(new DisjunctionExpr(new ConstantExpr(true), new ConstantExpr(true)));
        controller.add_expr(new DisjunctionExpr(new ConstantExpr(true), new ConstantExpr(false)));
        controller.add_expr(new DisjunctionExpr(new ConstantExpr(false), new ConstantExpr(false)));

        controller.add_expr(new NegationStmt(new ConstantExpr(true)));
        controller.add_expr(new NegationStmt(new ConstantExpr(false)));

        System.out.println( controller.evalExpr(0) );
        System.out.println( controller.evalExpr(1) );
        System.out.println( controller.evalExpr(2) );
        System.out.println( controller.evalExpr(3) );
        System.out.println( controller.evalExpr(4) );
        System.out.println( controller.evalExpr(5) );
        System.out.println( controller.evalExpr(6) );
        System.out.println( controller.evalExpr(7) );
    }
}
