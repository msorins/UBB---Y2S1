package controller;

import model.adts.MyIDictionary;
import model.state.PrgState;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public interface IController {
    PrgState oneStep(PrgState state) throws Exception;
    PrgState oneStep(int index) throws Exception;

    void allSteps(PrgState state) throws Exception;
    void allSteps(int index) throws Exception;

    String display(PrgState state);
    String display(int index);

    HashMap<Integer, Integer> conservativeGarbageCollector(MyIDictionary<String, Integer> symTable, MyIDictionary<Integer, Integer> heap);
}
