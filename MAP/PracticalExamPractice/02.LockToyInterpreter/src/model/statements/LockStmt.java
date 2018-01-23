package model.statements;

import model.adts.MyIDictionary;
import model.adts.MyIList;
import model.expressions.IExp;
import model.state.PrgState;

public class LockStmt implements IStmt{
    private String var;

    public LockStmt(String var) {
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

                    // If the lock is free
                    if(lockValue == -1) {
                        lockTbl.update(varValue, state.getId());
                    } else {
                        // If the lock is still not free
                        state.getExeStack().push( new LockStmt(var) );
                    }

                } else {
                    throw new Exception("Lock: Value not in Lock Table");
                }
            }

        }
        else
            throw new Exception("Lock: Variable not in Sym Table");

        return null;
    }

    @Override
    public String toString() {
        return "lock( " + var +" )";
    }

}