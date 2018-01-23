package model.statements;

import model.adts.MyIDictionary;
import model.expressions.IExp;
import model.state.PrgState;

public class NewLockStmt implements IStmt{
    private String var;

    //Constructor
    public NewLockStmt(String varn) {
        var = varn;
    }

    public PrgState execute(PrgState state) throws Exception {
        MyIDictionary<String,Integer> symTbl= state.getSymTable();
        MyIDictionary<Integer,Integer> lockTbl= state.getLockTable();


        int nextFreeLocation = lockTbl.sizeMax() + 1;

        // Add the lock to the locktable (initially unlocked)
        synchronized (this) {
            lockTbl.insert(nextFreeLocation, -1);
        }

        // Add the index from lockTbl to the sym table
        if(symTbl.find(var)) {
            symTbl.update(var, nextFreeLocation);
        }
        else {
            symTbl.insert(var, nextFreeLocation);
        }

        return null;
    }

    @Override
    public String toString() {
        return "NewLock( "+ var +" )";
    }
}
