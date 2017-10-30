package view.commands;

import controller.Controller;

public abstract class Command {
    protected Controller controller;
    private String key, description;

    public Command(String key, String description, Controller controller) {
        this.key = key;
        this.description = description;
        this.controller = controller;
    }

    public abstract void execute() throws Exception;
    public String getKey(){return key;}
    public String getDescription(){return description;}
}