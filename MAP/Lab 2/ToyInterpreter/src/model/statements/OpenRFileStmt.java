package model.statements;

import exceptions.StatementsExceptions;
import model.adts.MyDictionary;
import model.adts.MyIDictionary;
import model.adts.MyIStack;
import model.state.FileTableData;
import model.state.PrgState;

import java.io.BufferedReader;
import java.io.FileReader;
import java.security.spec.ECField;
import java.util.Random;

public class OpenRFileStmt implements IStmt {
    private String var_file;
    private String filename;

    public OpenRFileStmt(String var_file, String filename) {
        this.var_file = var_file;
        this.filename = filename;
    }

    @Override
    public PrgState execute(PrgState state) throws Exception {
        MyIDictionary<Integer, FileTableData> fileTbl = state.getFileTable();

        //Check to see the file is not opened
        boolean found = false;
        for(Integer key: fileTbl.getKeys()) {
            if( fileTbl.get(key).filename.equals(filename) )
                throw  new StatementsExceptions("Filename already exists");
        }

        //Try to open the file
        try {
            //Create the buffer
            BufferedReader bufferedReader = new BufferedReader(new FileReader(filename));

            //Create a random Int key that is not found
            int uniqueIntKey = fileTbl.sizeMax();

            fileTbl.insert(uniqueIntKey, new FileTableData(filename, bufferedReader));
        }
        catch (Exception e) {
            throw new StatementsExceptions("Error in reading filename: " + filename + ". " + e.toString());
        }

        return state;
    }

    @Override
    public String toString() {
        return "openRFileStmt( " + var_file + ", " + filename + ") ";
    }
}
