package repository;

import exceptions.AdtExceptions;
import model.state.PrgState;

import java.io.IOException;

public interface IRepositoryLog extends IRepository{
    void logPrgStateExec(PrgState state) throws IOException, AdtExceptions;
}
