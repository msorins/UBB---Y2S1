package Repository;

import Model.Expr.IExpr;

import java.util.Vector;

public class Repository {
    private Vector<IExpr> data;

    public Repository() {
        data = new Vector<IExpr>();
    }

    public void push_back(IExpr expr) {
        data.add(expr);
    }

    public IExpr get(int pos) {
        return data.get(pos);
    }

    public int getSize() {
        return data.size();
    }
}
