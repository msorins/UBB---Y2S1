package view.commands;

import controller.Controller;

import java.util.Scanner;

public class RunOneStepCommand extends Command {

    public RunOneStepCommand(String key, String description, Controller controller) {
        super(key, description, controller);
    }

    @Override
    public void execute() throws Exception {
        int index = getNr("index: ");
        executeOneStepAt(index);
        printProgramAt(index);
    }

    private int getNr(String msg) {
        System.out.println(msg);

        Scanner sc = new Scanner(System.in);
        return sc.nextInt();
    }

    private void executeOneStepAt(int index) throws Exception {
        controller.oneStep( controller.getProgramAt(index) );
    }

    private void printProgramAt(int index) {
        System.out.println( controller.getProgramAt(index).toString()  );
    }
}