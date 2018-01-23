package model.statements;

import model.adts.MyIStack;
import model.expressions.IExp;
import model.state.PrgState;

public class IfStmt implements IStmt{
    private IExp exp;
    private IStmt thenS;
    private IStmt elseS;

    //Constructor
    public IfStmt(IExp e, IStmt t, IStmt el) {
        exp = e;
        thenS = t;
        elseS = el;
    }

    public PrgState execute(PrgState state) throws Exception {
        //To do
        MyIStack<IStmt> exeStack = state.getExeStack();

        if(exp.eval(state.getTopSymTable(), state.getHeap()) == 1 ) {
            exeStack.push(thenS);
        } else {
            exeStack.push(elseS);
        }
        return null;
    }

    @Override
    public String toString() {
        return "IF("+ exp.toString()+") THEN(" +thenS.toString()
            +")ELSE("+elseS.toString()+")";
    }
}
