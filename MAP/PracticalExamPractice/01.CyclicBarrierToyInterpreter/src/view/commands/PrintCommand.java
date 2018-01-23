package view.commands;


import controller.Controller;
import model.expressions.ArithExp;
import model.expressions.ConstExp;
import model.expressions.IExp;
import model.expressions.VarExp;
import model.statements.*;

import java.util.Scanner;

public class PrintCommand extends Command {

    public PrintCommand(String key, String description, Controller controller) throws Exception {
        super(key, description, controller);
    }

    @Override
    public void execute() throws Exception {
        printPrograms();
    }

    public void printPrograms() {
        System.out.println( ""  + controller.getPrograms().toString()  );
    }

}
