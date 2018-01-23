package model.statements;

import model.adts.MyDictionary;
import model.adts.MyIStack;
import model.adts.MyStack;
import model.state.PrgState;

import java.util.HashMap;
import java.util.Stack;

public class ForkStmt implements IStmt {
    private IStmt stmt;

    public ForkStmt(IStmt stmt) {
        this.stmt = stmt;
    }

    public PrgState execute(PrgState state){
        MyIStack<IStmt> exeStack = state.getExeStack();

        MyStack<IStmt> newExeStack = new MyStack<IStmt>();

        Stack< MyDictionary<String, Integer> > newSymTbl = (Stack<MyDictionary<String, Integer>>) state.getSymTable().clone();

        PrgState newState = new PrgState(
                newExeStack,
                newSymTbl,
                state.getOut(),
                this.stmt,
                state.getFileTable(),
                state.getHeap(),
                state.getProcTable(),
                state.getId() * 10
                );

        return newState;
    }

    @Override
    public  String toString() {
        return "fork("+ stmt.toString() +" )";
    }
}
