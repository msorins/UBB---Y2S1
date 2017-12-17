package repository;

import exceptions.AdtExceptions;
import model.adts.MyDictionary;
import model.adts.MyList;
import model.adts.MyStack;
import model.state.FileTableData;
import model.state.PrgState;
import model.statements.IStmt;

import java.io.*;
import java.util.Scanner;

public class Repository implements IRepository, IRepositoryLog{
    private MyList<PrgState> programs;
    private String logFilePath;

    public Repository() {
        this.programs = new MyList<PrgState>();
        initRepoLogFilePath();
    }

    public Repository(String path) {
        this.programs = new MyList<PrgState>();
        logFilePath = path;
    }

    private void initRepoLogFilePath() {
        System.out.print("Repository log file path: ");
        Scanner sc = new Scanner(System.in);
        logFilePath = sc.nextLine();
    }

    public MyList<PrgState> getPrograms() {
        return programs;
    }

    @Override
    public void setPrograms(MyList<PrgState> programs) {
        this.programs = programs;
    }

    @Override
    public PrgState addProgram(IStmt stmt) throws Exception {
        if(programs.size() != 0)
            throw new Exception("Only one program can be added");

        PrgState newProg = new PrgState(
                new MyStack<>(),
                new MyDictionary<String, Integer>(),
                new MyList<Integer>(),
                stmt,
                new MyDictionary<Integer, FileTableData>(),
                new MyDictionary<Integer, Integer>(),
                1
        );

        programs.push_back(newProg);

        return newProg;
    }

    @Override
    public void logPrgStateExec(PrgState state) throws IOException, AdtExceptions {
        PrintWriter logFile = new PrintWriter(new BufferedWriter(new FileWriter(logFilePath, true)));
        logFile.append("\n=== Prog Eval (ID "+ state.getId() +") ===\n");

        logFile.append("ExeStack:\n");
        logFile.append(state.getExeStack().toString() + "\n");
        logFile.append("SymTable:\n");
        logFile.append(state.getSymTable().toString() + "\n");
        logFile.append("Out:\n");
        logFile.append(state.getOut().toString() + "\n");
        logFile.append("FileTable:\n");
        logFile.append(state.getFileTable().toString() + "\n");
        logFile.append("Heap: \n");
        logFile.append(state.getHeap().toString() + "\n");

        logFile.flush();
    }
}