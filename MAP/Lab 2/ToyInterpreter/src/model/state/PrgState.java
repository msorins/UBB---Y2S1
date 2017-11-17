package model.state;

import model.adts.MyDictionary;
import model.adts.MyIDictionary;
import model.adts.MyIList;
import model.adts.MyIStack;
import model.statements.IStmt;

import java.io.BufferedReader;
import java.io.File;

public class PrgState {
    private MyIStack<IStmt> exeStack;
    private MyIDictionary<String, Integer> symTable;
    private MyIList<Integer> out;
    private IStmt originalProgram;
    private MyIDictionary<Integer, FileTableData> fileTable;
    private MyIDictionary<Integer, Integer> heap;

    public PrgState(MyIStack<IStmt> stk, MyIDictionary<String, Integer> symtbl, MyIList<Integer> ot, IStmt prg, MyIDictionary<Integer, FileTableData> ft, MyIDictionary<Integer, Integer> hp){
        exeStack = stk;
        symTable = symtbl;
        out = ot;
        originalProgram = prg;
        fileTable = ft;
        heap = hp;
        stk.push(prg);
    }

    @Override
    public String toString() {
        return "PrgState { " +
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
}
