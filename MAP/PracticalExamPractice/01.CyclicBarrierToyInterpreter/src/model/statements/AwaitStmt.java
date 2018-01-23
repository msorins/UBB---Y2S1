package model.statements;

import model.adts.MyIDictionary;
import model.adts.MyIStack;
import model.expressions.IExp;
import model.state.CyclicBarrierData;
import model.state.PrgState;

import java.util.ArrayList;

public class AwaitStmt implements IStmt{
    private String varname;

    //Constructor
    public AwaitStmt(String varn) {
        varname = varn;
    }

    public PrgState execute(PrgState state) throws Exception {
        MyIDictionary<String,Integer> symTbl= state.getSymTable();
        MyIStack<IStmt> stackTbl = state.getExeStack();
        MyIDictionary<Integer, CyclicBarrierData> barrierTbl = state.getBarrierTable();


        //Check to see if the variable exists in symTable
        if(symTbl.find(varname)) {
            int barrierIndex = symTbl.get(varname);

            //Check to see if barrier index is valid
            if(barrierTbl.find(barrierIndex)) {
                CyclicBarrierData brData = barrierTbl.get(barrierIndex);
                if(brData.getThreadIdentifiers().size() == brData.getBarrierValue()) {
                    return null;
                } else {
                    boolean crtStateIdInTheBarrier = false;

                    for(Integer elem: brData.getThreadIdentifiers()) {
                        if(elem == state.getId()) {
                            crtStateIdInTheBarrier = true;
                            break;
                        }
                    }

                    if(crtStateIdInTheBarrier) {
                        //Add the Await statement to the stack
                        stackTbl.push(new AwaitStmt(varname));
                    } else {
                        brData.getThreadIdentifiers().add(state.getId());

                        //Update the Barrier table
                        synchronized (this) {
                            barrierTbl.update(barrierIndex, brData);
                        }

                        //Add the Await statement to the stack
                        stackTbl.push(new AwaitStmt(varname));
                    }
                }

            } else {
                throw new Exception("AwaitStmt - barrier index not found in barrierTable");
            }
        } else {
            throw new Exception("AwaitStmt - var name not found in symTable");
        }
        return null;
    }

    @Override
    public String toString() {
        return "Await( "+ varname +" ) ";
    }
}
