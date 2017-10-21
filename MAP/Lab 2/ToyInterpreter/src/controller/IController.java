package controller;

import model.state.PrgState;

public interface IController {
    PrgState oneStep(PrgState state) throws Exception;
    PrgState oneStep(int index) throws Exception;

    void allSteps(PrgState state) throws Exception;
    void allSteps(int index) throws Exception;

    String display(PrgState state);
    String display(int index);
}
