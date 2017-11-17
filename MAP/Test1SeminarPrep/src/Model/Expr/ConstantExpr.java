package Model.Expr;

public class ConstantExpr implements IExpr {
    boolean nr;

    public ConstantExpr(boolean n) {
        nr = n;
    }

    @Override
    public boolean eval() {
        return nr;
    }

    @Override
    public String toString() {
        return "" + nr;
    }
}
