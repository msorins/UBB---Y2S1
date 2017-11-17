package Model.Expr;

public class NegationStmt implements IExpr{
    private IExpr expr;

    public NegationStmt(IExpr A) {
        expr = A;
    }

    @Override
    public boolean eval() {
        return !expr.eval();
    }
}
