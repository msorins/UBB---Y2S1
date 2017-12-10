package model.statements;

import model.adts.MyIDictionary;
import model.adts.MyIStack;
import model.expressions.IExp;
import model.state.FileTableData;
import model.state.PrgState;

public class NewStmt implements IStmt{
    private String varname;
    private IExp exp;

    //Constructor
    public NewStmt(String varn, IExp e) {
        varname = varn;
        exp = e;
    }

    public PrgState execute(PrgState state) throws Exception {
        MyIDictionary<String, Integer> symDict = state.getSymTable();
        MyIDictionary<String,Integer> symTbl= state.getSymTable();
        MyIDictionary<Integer,Integer> heapTbl= state.getHeap();

        //Eval expression
        int exprRes = exp.eval(symDict, heapTbl);

        //Store the result in heap
        int heapLocation = heapTbl.sizeMax() + 1;
        heapTbl.insert(heapLocation, exprRes);

        //Store the heap location in sym tab
        symTbl.update(varname, heapLocation);

        return null;
    }

    @Override
    public String toString() {
        return "NEW("+ varname +", " + exp.toString() +" ) ";
    }
}
