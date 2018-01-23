package model.statements;
import model.state.PrgState;

public interface IStmt {
    PrgState execute(PrgState state) throws Exception;
}
