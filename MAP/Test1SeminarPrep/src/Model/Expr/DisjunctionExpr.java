package Model.Expr;

public class DisjunctionExpr implements IExpr {
    private IExpr exprA;
    private IExpr exprB;

    public DisjunctionExpr(IExpr A, IExpr B) {
        exprA = A;
        exprB = B;
    }
    @Override
    public boolean eval() {
        return exprA.eval() && exprB.eval();
    }
}
