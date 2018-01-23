package model.state;

import model.statements.IStmt;

import java.util.ArrayList;

public class ProcTableData {
    public ArrayList<String> variableNames;
    public IStmt body;

    public ProcTableData(ArrayList<String> vn, IStmt b) {
        this.variableNames = vn;
        this.body = b;
    }

    public ProcTableData() {
    }

    @Override
    public String toString() {
        return "(" +
                 variableNames.toString() +
                ") { " + body.toString() +
                " }";
    }
}
