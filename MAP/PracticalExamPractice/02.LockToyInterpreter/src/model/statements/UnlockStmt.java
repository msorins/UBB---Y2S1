package model.statements;

import model.adts.MyIDictionary;
import model.adts.MyIList;
import model.expressions.IExp;
import model.state.PrgState;

public class UnlockStmt implements IStmt{
    private String var;

    public UnlockStmt(String var) {
        this.var = var;
    }

    public PrgState execute(PrgState state) throws Exception {
        MyIDictionary<String,Integer> symTbl= state.getSymTable();
        MyIDictionary<Integer, Integer> lockTbl = state.getLockTable();

        if(symTbl.find(var)) {
            int varValue = symTbl.get(var);

            synchronized (this) {
                if(lockTbl.find(varValue)) {
                    int lockValue = lockTbl.get(varValue);

                    // If the lock is locked by this thread, just unlock it
                    if(lockValue == state.getId()) {
                       lockTbl.update(varValue, -1);
                    }

                }
            }

        }
        else
            throw new Exception("Unlock: Variable not in Sym Table");

        return null;
    }

    @Override
    public String toString() {
        return "unlock( " + var +" )";
    }

}