package model.state;

import model.adts.MyDictionary;
import model.adts.MyIDictionary;
import model.adts.MyIList;
import model.adts.MyIStack;
import model.statements.IStmt;

import java.io.BufferedReader;
import java.io.File;
import java.util.concurrent.ExecutorService;

public class PrgState {
    private MyIStack<IStmt> exeStack;
    private MyIDictionary<String, Integer> symTable;
    private MyIList<Integer> out;
    private IStmt originalProgram;
    private MyIDictionary<Integer, FileTableData> fileTable;
    private MyIDictionary<Integer, Integer> heap;
    private MyIDictionary<Integer, CyclicBarrierData> barrierTable;

    private int id;

    public PrgState(MyIStack<IStmt> stk, MyIDictionary<String, Integer> symtbl, MyIList<Integer> ot, IStmt prg, MyIDictionary<Integer, FileTableData> ft, MyIDictionary<Integer, Integer> hp, MyIDictionary<Integer, CyclicBarrierData> bt, int id){
        exeStack = stk;
        symTable = symtbl;
        out = ot;
        originalProgram = prg;
        fileTable = ft;
        heap = hp;
        barrierTable = bt;
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

    public MyIDictionary<String, Integer> getSymTable() {
        return symTable;
    }

    public void setSymTable(MyIDictionary<String, Integer> symTable) {
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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public MyIDictionary<Integer, CyclicBarrierData> getBarrierTable() {
        return barrierTable;
    }
}
