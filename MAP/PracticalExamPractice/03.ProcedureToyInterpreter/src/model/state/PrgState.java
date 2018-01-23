package model.state;

import model.adts.MyDictionary;
import model.adts.MyIDictionary;
import model.adts.MyIList;
import model.adts.MyIStack;
import model.statements.IStmt;

import java.io.BufferedReader;
import java.io.File;
import java.util.Stack;
import java.util.concurrent.ExecutorService;

public class PrgState {
    private MyIStack<IStmt> exeStack;
    private Stack< MyDictionary<String, Integer> > symTable;
    private MyIList<Integer> out;
    private IStmt originalProgram;
    private MyIDictionary<Integer, FileTableData> fileTable;
    private MyIDictionary<Integer, Integer> heap;
    private MyIDictionary<String, ProcTableData> procTable;
    private int id;

    public PrgState(MyIStack<IStmt> stk, Stack< MyDictionary<String, Integer> > symtbl, MyIList<Integer> ot, IStmt prg, MyIDictionary<Integer, FileTableData> ft, MyIDictionary<Integer, Integer> hp, MyIDictionary<String, ProcTableData> pt, int id){
        exeStack = stk;
        symTable = symtbl;
        out = ot;
        originalProgram = prg;
        fileTable = ft;
        heap = hp;
        this.procTable = pt;
        this.id = id;
        stk.push(prg);
    }

    public PrgState oneStep() throws Exception {
        if(exeStack.empty())
            throw new Exception("No more operations needed");

        IStmt crtStatement = exeStack.pop();

        PrgState res = crtStatement.execute(this);
        return res;
    }

    public boolean isNotCompleted() {
        return !this.exeStack.empty();
    }

    @Override
    public String toString() {
        return id + ": PrgState { " +
                "\n \texeStack = " + exeStack.toString() +
                "\n \tsymTable = " + symTable.toString() +
                "\n \tout = " + out.toString() +
                "\n \tfileTable = " + fileTable.toString() +
                "\n \theap = " + heap.toString() +
                "\n \toriginalProgram = " + originalProgram.toString() +
                "\n }";
    }

    public MyIStack<IStmt> getExeStack() {
        return exeStack;
    }

    public void setExeStack(MyIStack<IStmt> exeStack) {
        this.exeStack = exeStack;
    }

    public Stack< MyDictionary<String, Integer>> getSymTable() {
        return symTable;
    }

    public MyIDictionary<String, Integer> getTopSymTable() {
        return symTable.peek();
    }

    public void setSymTable(Stack< MyDictionary<String, Integer> > symTable) {
        this.symTable = symTable;
    }

    public MyIList<Integer> getOut() {
        return out;
    }

    public void setOut(MyIList<Integer> out) {
        this.out = out;
    }

    public IStmt getOriginalProgram() {
        return originalProgram;
    }

    public void setOriginalProgram(IStmt originalProgram) {
        this.originalProgram = originalProgram;
    }

    public MyIDictionary<Integer, FileTableData> getFileTable() {
        return fileTable;
    }

    public void setFileTable(MyIDictionary<Integer, FileTableData> fileTable) {
        this.fileTable = fileTable;
    }

    public MyIDictionary<Integer, Integer> getHeap() {
        return heap;
    }

    public void setHeap(MyIDictionary<Integer, Integer> heap) {
        this.heap = heap;
    }

    public MyIDictionary<String, ProcTableData> getProcTable() {
        return procTable;
    }

    public void setProcTable(MyIDictionary<String, ProcTableData> procTable) {
        this.procTable = procTable;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
