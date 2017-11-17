package Model.Expr;

public class ConjunctionExpr implements IExpr{
    private IExpr exprA;
    private IExpr exprB;

    public ConjunctionExpr(IExpr A, IExpr B) {
        exprA = A;
        exprB = B;
    }

    @Override
    public boolean eval() {
        return exprA.eval() || exprB.eval();
    }
}
