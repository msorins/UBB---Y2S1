package model.statements;

import exceptions.ExpressionExceptions;
import model.adts.MyDictionary;
import model.adts.MyIDictionary;
import model.expressions.IExp;
import model.state.FileTableData;
import model.state.PrgState;

public class ReadFileStmt implements IStmt {
    private IExp exp_file_id;
    private String var_name;

    public ReadFileStmt(IExp exp_file_id, String var_name) {
        this.exp_file_id = exp_file_id;
        this.var_name = var_name;
    }

    @Override
    public PrgState execute(PrgState state) throws Exception {
        MyIDictionary<Integer, FileTableData> fileTbl = state.getFileTable();
        MyIDictionary<String, Integer> symDict = state.getTopSymTable();
        MyIDictionary<String,Integer> symTbl= state.getTopSymTable();
        MyIDictionary<Integer, Integer> heapTbl = state.getHeap();

        //Eval expression
        int fileId = exp_file_id.eval(symDict, heapTbl);

        //Find fileId in the fileTabel
        if(!fileTbl.find(fileId))
            throw new ExpressionExceptions("No file with given id");

        FileTableData fileTableData = fileTbl.get(fileId);

        //Read next line
        String line = fileTableData.bufferedReader.readLine();
        int readValue;

        if(line.length() == 0) {
            readValue = 0;
        } else {
            readValue = Integer.parseInt(line);
        }

        //Add to sym map
        if(symTbl.find(var_name))
            symTbl.update(var_name, readValue);
        else
            symTbl.insert(var_name, readValue);

        return null;
    }

    @Override
    public String toString() {
        return "ReadFileStmt( " + exp_file_id.toString() + ", " + var_name + " )";
    }


}
