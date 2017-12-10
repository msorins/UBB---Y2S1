package view.commands;

import controller.Controller;
import model.state.PrgState;

import java.util.List;
import java.util.Scanner;

public class RunAllStepsCommand extends Command {

    public RunAllStepsCommand(String key, String description, Controller controller) {
        super(key, description, controller);
    }

    @Override
    public void execute() throws Exception {
        executeAllSteps();
        printProgram();
    }

    private int getNr(String msg) {
        System.out.print(msg);

        Scanner sc = new Scanner(System.in);
        return sc.nextInt();
    }

    private void executeOneStep() throws Exception {
        controller.oneStepForAll((List<PrgState>) controller.getPrograms().getData());
    }

    private void printProgram() {
        System.out.println( controller.getPrograms().toString()  );
    }

    private void executeAllSteps() throws Exception {
        controller.allStep();
    }
}