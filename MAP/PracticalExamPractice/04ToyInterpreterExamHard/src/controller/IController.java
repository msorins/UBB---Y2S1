package controller;

import model.adts.MyIDictionary;
import model.state.FileTableData;
import model.state.PrgState;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface IController {
    void oneStepForAll(List<PrgState>  prgList) throws InterruptedException;
    void allStep() throws InterruptedException;

    String display(PrgState state);
    String display(int index);

    public void programEndingFileGarbageCollector(MyIDictionary<Integer, FileTableData> fileTable);
    HashMap<Integer, Integer> conservativeGarbageCollector(MyIDictionary<String, Integer> symTable, MyIDictionary<Integer, Integer> heap);

    List<PrgState> removeCompletedPrg(List<PrgState> inPrgList);
}
