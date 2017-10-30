package view.commands;

import controller.Controller;

import java.util.Scanner;

public class RunAllStepsCommand extends Command {

    public RunAllStepsCommand(String key, String description, Controller controller) {
        super(key, description, controller);
    }

    @Override
    public void execute() throws Exception {
        int index = getNr("index: ");
        executeAllStepsAt(index);
        printProgramAt(index);
    }

    private int getNr(String msg) {
        System.out.print(msg);

        Scanner sc = new Scanner(System.in);
        return sc.nextInt();
    }

    private void executeOneStepAt(int index) throws Exception {
        controller.oneStep( controller.getProgramAt(index) );
    }

    private void printProgramAt(int index) {
        System.out.println( controller.getProgramAt(index).toString()  );
    }

    private void executeAllStepsAt(int index) throws Exception {
        controller.allSteps( controller.getProgramAt(index) );
    }
}