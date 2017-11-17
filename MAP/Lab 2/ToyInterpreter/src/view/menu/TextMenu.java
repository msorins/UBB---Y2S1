package view.menu;

import exceptions.AdtExceptions;
import model.adts.MyDictionary;
import view.commands.Command;

import java.util.Scanner;

public class TextMenu {
    private MyDictionary<String, Command> commands;

    public TextMenu() {
        this.commands = new MyDictionary<>();
    }

    public void addCommand(Command c) throws AdtExceptions {
        commands.insert(c.getKey(), c);
    }

    private void printMenu() throws Exception {
        for (Command com : commands.getValues()) {
            if (com == null) {
                System.out.print("Invalid Option");
                continue;
            }

            System.out.println(com.getKey() + ". " + com.getDescription());
        }
    }

    public void show() throws Exception {
        Scanner scanner = new Scanner(System.in);
        while (true) {
            //OUTPUT
            printMenu();
            System.out.printf("\n\nInput the option: ");

            //INPUT
            String key = scanner.nextLine();
            Command com = commands.get(key);
            if (com == null) {
                System.out.println("Invalid Option");
                continue;
            }
            com.execute();
        }
    }
}


