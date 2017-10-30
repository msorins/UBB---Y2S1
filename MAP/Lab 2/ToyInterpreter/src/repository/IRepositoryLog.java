package repository;

import exceptions.AdtExceptions;
import java.io.IOException;

public interface IRepositoryLog extends IRepository{
    void logPrgStateExec() throws IOException, AdtExceptions;
}
