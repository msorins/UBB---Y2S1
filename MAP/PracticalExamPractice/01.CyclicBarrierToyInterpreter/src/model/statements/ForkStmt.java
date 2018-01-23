package model.statements;

import model.adts.MyDictionary;
import model.adts.MyIStack;
import model.adts.MyStack;
import model.state.PrgState;

import java.util.HashMap;
import java.util.Random;

public class ForkStmt implements IStmt {
    private IStmt stmt;

    public ForkStmt(IStmt stmt) {
        this.stmt = stmt;
    }

    public PrgState execute(PrgState state){
        MyIStack<IStmt> exeStack = state.getExeStack();

        MyStack<IStmt> newExeStack = new MyStack<IStmt>();

        MyDictionary<String, Integer> newSymTbl = new MyDictionary<String, Integer> ();
        newSymTbl.setData(new HashMap<String, Integer>(state.getSymTable().getData()));

        Random rand = new Random();

        PrgState newState = new PrgState(
                newExeStack,
                newSymTbl,
                state.getOut(),
                this.stmt,
                state.getFileTable(),
                state.getHeap(),
                state.getBarrierTable(),
                rand.nextInt(100000) * state.getId()
                );

        return newState;
    }

    @Override
    public  String toString() {
        return "fork("+ stmt.toString() +" )";
    }
}
