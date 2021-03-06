package repository;

import exceptions.AdtExceptions;
import model.adts.MyList;
import model.state.PrgState;
import model.statements.IStmt;

import java.io.IOException;

public interface IRepository {
    MyList<PrgState> getPrograms();
    void setPrograms(MyList<PrgState> programs);
    PrgState addProgram(IStmt stmt) throws Exception;
}
