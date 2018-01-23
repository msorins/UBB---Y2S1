package model.statements;

import model.adts.MyIDictionary;
import model.expressions.IExp;
import model.state.CyclicBarrierData;
import model.state.PrgState;

import java.util.ArrayList;

public class NewBarrierStmt implements IStmt{
    private String varname;
    private IExp exp;

    //Constructor
    public NewBarrierStmt(String varn, IExp e) {
        varname = varn;
        exp = e;
    }

    public PrgState execute(PrgState state) throws Exception {
        MyIDictionary<String, Integer> symDict = state.getSymTable();
        MyIDictionary<String,Integer> symTbl= state.getSymTable();
        MyIDictionary<Integer,Integer> heapTbl= state.getHeap();
        MyIDictionary<Integer, CyclicBarrierData> barrierTbl = state.getBarrierTable();

        //Eval expression
        int exprRes = exp.eval(symDict, heapTbl);

        //Synchronized part
        //Create the barrier
        synchronized (this) {
            int newLocation = barrierTbl.sizeMax() + 1;
            barrierTbl.insert(  newLocation, new CyclicBarrierData(new ArrayList<Integer>(), exprRes));

            //Create the variable
            if(symTbl.find(varname))
                symTbl.update(varname, newLocation);
            else
                symTbl.insert(varname, newLocation);
        }

        return null;
    }

    @Override
    public String toString() {
        return "NewBarrier("+ varname +", " + exp.toString() +" ) ";
    }
}
