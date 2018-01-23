package model.statements;

import exceptions.ExpressionExceptions;
import model.adts.MyDictionary;
import model.adts.MyIDictionary;
import model.adts.MyIStack;
import model.expressions.IExp;
import model.state.FileTableData;
import model.state.PrgState;

public class CloseRFileStmt implements IStmt {
    private IExp exp_file_id;

    public CloseRFileStmt(IExp exp_file_id) {
        this.exp_file_id = exp_file_id;
    }

    @Override
    public PrgState execute(PrgState state) throws Exception {
        MyIDictionary<Integer, FileTableData> fileTbl = state.getFileTable();
        MyIDictionary<String, Integer> symDict = state.getSymTable();
        MyIDictionary<Integer, Integer> heap = state.getHeap();

        //Eval expression
        int fileId = exp_file_id.eval(symDict, heap);

        //Find fileId in the fileTabel
        if(!fileTbl.find(fileId))
            throw new ExpressionExceptions("No file with given id");

        FileTableData fileTableData = fileTbl.get(fileId);

        //Call close on that file
        fileTableData.bufferedReader.close();

        //Delete entry from FileTable
        fileTbl.erase(fileId);

        return null;
    }

    @Override
    public String toString() {
        return "CloseRFileStmt( " + exp_file_id.toString() + " )";
    }
}
