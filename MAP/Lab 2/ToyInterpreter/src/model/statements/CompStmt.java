package model.statements;

import model.adts.MyIStack;
import model.state.PrgState;

public class CompStmt implements IStmt {
    private IStmt first;
    private IStmt second;

    public CompStmt(IStmt first, IStmt second) {
        this.first = first;
        this.second = second;
    }

    public PrgState execute(PrgState state){
        MyIStack<IStmt> exeStack = state.getExeStack();
        exeStack.push(second);
        exeStack.push(first);

        return null;
    }

    @Override
    public  String toString() {
        return "("+first.toString() + ";" + second.toString()+")";
    }
}
