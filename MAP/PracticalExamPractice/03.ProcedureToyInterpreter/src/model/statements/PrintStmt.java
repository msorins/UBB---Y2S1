package model.statements;

import model.adts.MyIList;
import model.expressions.IExp;
import model.state.PrgState;

public class PrintStmt implements IStmt{
    private IExp exp;

    public PrintStmt(IExp exp) {
        this.exp = exp;
    }

    public PrgState execute(PrgState state) throws Exception {
        MyIList<Integer> printState = state.getOut();
        printState.push_back(exp.eval(state.getTopSymTable(), state.getHeap()) );

        return null;
    }

    @Override
    public String toString() {
        return "print(" +exp.toString()+")";
    }

}