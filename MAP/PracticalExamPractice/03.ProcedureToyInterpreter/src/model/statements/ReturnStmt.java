package model.statements;

import model.state.PrgState;

public class ReturnStmt implements IStmt {

    @Override
    public PrgState execute(PrgState state) throws Exception {
        state.getSymTable().pop();

        return null;
    }

    @Override
    public String toString() {
        return "ReturnStmt{}";
    }
}
