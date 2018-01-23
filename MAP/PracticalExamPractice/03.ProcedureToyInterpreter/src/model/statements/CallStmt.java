package model.statements;

import model.adts.MyDictionary;
import model.adts.MyIDictionary;
import model.adts.MyIStack;
import model.expressions.IExp;
import model.state.PrgState;
import model.state.ProcTableData;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Stack;

public class CallStmt implements IStmt{
    String fname;
    private ArrayList<IExp> exprs;

    public CallStmt(String f, ArrayList<IExp> e) {
        this.fname = f;
        this.exprs = e;
    }

    @Override
    public String toString() {
        return  "call "+ fname + "( " + exprs.toString() + ") ";
    }

    public PrgState execute(PrgState state) throws Exception {
        MyIStack<IStmt> stackTable = state.getExeStack();
        Stack<MyDictionary<String, Integer>> symTable = state.getSymTable();
        MyIDictionary<String,Integer> topSymTable= state.getTopSymTable();
        MyDictionary<String,Integer> newSymTbl=  new MyDictionary<String, Integer>();
        newSymTbl.setData(new HashMap<String, Integer>(topSymTable.getData()));

        MyIDictionary<Integer, Integer> heapTbl = state.getHeap();
        MyIDictionary<String, ProcTableData> procTbl = state.getProcTable();


        if(procTbl.find(fname)) {
            ProcTableData procData = procTbl.get(fname);

            // Evaluate all the params
            for(int i = 0; i < this.exprs.size(); i++) {
                String key = procData.variableNames.get(i);
                int value = this.exprs.get(i).eval(topSymTable, heapTbl);

                if (newSymTbl.find(key))
                    newSymTbl.update(key, value);
                else
                    newSymTbl.insert(key, value);
            }

            // Push New SymTbl to stack
            symTable.push( newSymTbl );

            // Push Return to stack
            stackTable.push( new ReturnStmt() );

            // Push Body of the procedure to stack
            stackTable.push( procData.body );

        } else {
            throw new Exception("CallStmt - function not found in ProcTable");
        }


        return null;
    }

}