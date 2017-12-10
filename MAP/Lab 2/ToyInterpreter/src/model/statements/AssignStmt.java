package model.statements;

import model.adts.MyIDictionary;
import model.adts.MyIStack;
import model.expressions.IExp;
import model.state.PrgState;

public class AssignStmt implements IStmt{
    private String id;
    private IExp exp;

    public AssignStmt(String id, IExp exp) {
        this.id = id;
        this.exp = exp;
    }

    @Override
    public String toString() {
        return id + "="+ exp.toString();
    }

    public PrgState execute(PrgState state) throws Exception {
        MyIStack<IStmt> stk=state.getExeStack();
        MyIDictionary<String,Integer> symTbl= state.getSymTable();
        MyIDictionary<Integer, Integer> heapTbl = state.getHeap();
        int val = exp.eval(symTbl, heapTbl);

        if(symTbl.find(id))
            symTbl.update(id, val);
        else
            symTbl.insert(id,val);

        return null;
    }

}