package repository;

import exceptions.AdtExceptions;
import model.adts.MyDictionary;
import model.adts.MyList;
import model.adts.MyStack;
import model.state.PrgState;
import model.statements.IStmt;

public class Repository implements IRepository{
    private MyList<PrgState> programs;

    public Repository() {
        this.programs = new MyList<PrgState>();
    }

    public MyList<PrgState> getPrograms() {
        return programs;
    }

    public PrgState getProgramAt(int index) throws AdtExceptions {
        return this.programs.getAt(index);
    }

    @Override
    public PrgState newProgram(IStmt stmt) {
        PrgState newProg = new PrgState(
                new MyStack<>(),
                new MyDictionary<String, Integer>(),
                new MyList<Integer>(),
                stmt
        );

        programs.push_back(newProg);

        return newProg;
    }
}