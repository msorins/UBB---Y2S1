package model.statements;

import model.adts.MyIDictionary;
import model.adts.MyIStack;
import model.expressions.IExp;
import model.state.FileTableData;
import model.state.PrgState;

public class wHStmt implements IStmt{
    private String varname;
    private IExp exp;

    //Constructor
    public wHStmt(String varn, IExp e) {
        varname = varn;
        exp = e;
    }

    public PrgState execute(PrgState state) throws Exception {
        MyIDictionary<String, Integer> symDict = state.getSymTable();
        MyIDictionary<Integer,Integer> heapTbl= state.getHeap();

        //Evaluate expression
        int exprResult = exp.eval(symDict, heapTbl);

        if(symDict.find(varname)) {
            //Get number from variable
            int varnameNr = symDict.get(varname);

            //Update into the heap the result of the expression
            heapTbl.update(varnameNr, exprResult);
        } else {
            throw new Exception("Variable not found");
        }

        return state;
    }

    @Override
    public String toString() {
        return "NEW("+ varname +", " + exp.toString() +" ) ";
    }
}
