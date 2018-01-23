package model.statements;

import model.adts.MyIDictionary;
import model.adts.MyIList;
import model.adts.MyIStack;
import model.expressions.IExp;
import model.state.PrgState;

public class WhileStmt implements IStmt{
    private IExp exp;
    private IStmt stmt;

    public WhileStmt(IExp exp, IStmt stmt) {
        this.exp = exp;
        this.stmt = stmt;
    }

    public PrgState execute(PrgState state) throws Exception {
        MyIDictionary<String,Integer> symTbl= state.getSymTable();
        MyIDictionary<Integer, Integer> heapTbl = state.getHeap();

        if( exp.eval(symTbl, heapTbl) != 0 ) {
            stmt.execute(state);
            state.getExeStack().push(new WhileStmt(exp, stmt));

        }

        return null;
    }

    @Override
    public String toString() {
        return "while(" +exp.toString()+")" + "{ " + stmt.toString() + " }";
    }

}