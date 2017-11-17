package Controller;

import Model.Expr.IExpr;
import Repository.Repository;

public class Controller {
    private Repository repo;

    public Controller() {
        repo = new Repository();
    }

    public void add_expr(IExpr expr) {
        repo.push_back(expr);
    }

    public IExpr getExpr(int pos){
        return repo.get(pos);
    }

    public int size() {
        return repo.getSize();
    }

    public boolean evalExpr(int pos) {
        return repo.get(pos).eval();
    }
}
