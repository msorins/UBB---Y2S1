package view.commands;

import controller.Controller;

public class ExitCommand extends Command {
    public ExitCommand(String key, String description, Controller controller){
        super(key, description, controller);
    }
    @Override
    public void execute() {
        System.exit(0);
    }
}