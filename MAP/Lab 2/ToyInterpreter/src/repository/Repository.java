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

    private void initRepoLogFilePath() {
        System.out.print("Repository log file path: ");
        Scanner sc = new Scanner(System.in);
        logFilePath = sc.nextLine();
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
                stmt,
                new MyDictionary<Integer, FileTableData>(),
                new MyDictionary<Integer, Integer>()
        );

        programs.push_back(newProg);

        return newProg;
    }

    @Override
    public void logPrgStateExec() throws IOException, AdtExceptions {
        PrintWriter logFile = new PrintWriter(new BufferedWriter(new FileWriter(logFilePath, true)));
        logFile.append("\n=== LogStart ===\n");
        for(int i = 0; i < getPrograms().size(); i++) {
            logFile.append("=== " + i + " ===\n");
            PrgState crtProg = getPrograms().getAt(i);
            logFile.append("ExeStack:\n");
            logFile.append(crtProg.getExeStack().toString() + "\n");
            logFile.append("SymTable:\n");
            logFile.append(crtProg.getSymTable().toString() + "\n");
            logFile.append("Out:\n");
            logFile.append(crtProg.getOut().toString() + "\n");
            logFile.append("FileTable:\n");
            //To add
        }
        logFile.flush();
    }
}