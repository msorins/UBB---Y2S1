package controller;

import exceptions.AdtExceptions;
import model.adts.MyIStack;
import model.adts.MyList;
import model.state.PrgState;
import model.statements.IStmt;
import repository.IRepository;
import repository.IRepositoryLog;
import repository.Repository;

public class Controller implements IController, IRepository {
    IRepositoryLog repo;

    public Controller(IRepositoryLog repo) {
        this.repo = repo;
    }

    public Controller() {
        repo = new Repository();
    }

    @Override
    public PrgState oneStep(PrgState state) throws Exception {
        MyIStack<IStmt> execStack = state.getExeStack();
        if(execStack.empty())
            throw new Exception("No more operations needed");

        IStmt crtStatement = execStack.pop();
        repo.logPrgStateExec();
        return crtStatement.execute(state);
    }

    @Override
    public PrgState oneStep(int index) throws Exception {
        PrgState state = repo.getProgramAt(index);
        return oneStep(state);
    }

    @Override
    public void allSteps(PrgState state) throws Exception {
        MyIStack<IStmt> execStack = state.getExeStack();
        while(!execStack.empty()) {
            oneStep(state);
        }
    }

    @Override
    public void allSteps(int index) throws Exception {
        PrgState state = repo.getProgramAt(index);
        allSteps(state);
    }

    @Override
    public String display(PrgState state) {
        return state.toString();
    }

    @Override
    public String display(int index) {
        try {
            return repo.getProgramAt(index).toString();
        } catch (AdtExceptions adtExceptions) {
            adtExceptions.printStackTrace();
        }
        return null;
    }

    @Override
    public MyList<PrgState> getPrograms() {
        return repo.getPrograms();
    }

    @Override
    public PrgState getProgramAt(int index) {
        try {
            return repo.getProgramAt(index);
        } catch (AdtExceptions adtExceptions) {
            adtExceptions.printStackTrace();
        }

        return null;
    }

    @Override
    public PrgState newProgram(IStmt stmt) {
        return repo.newProgram(stmt);
    }
}
