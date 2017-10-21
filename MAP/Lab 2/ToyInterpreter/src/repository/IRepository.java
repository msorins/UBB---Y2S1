package repository;

import exceptions.AdtExceptions;
import model.adts.MyList;
import model.state.PrgState;
import model.statements.IStmt;

public interface IRepository {
    MyList<PrgState> getPrograms();
    PrgState getProgramAt(int index) throws AdtExceptions;
    PrgState newProgram(IStmt stmt);
}
