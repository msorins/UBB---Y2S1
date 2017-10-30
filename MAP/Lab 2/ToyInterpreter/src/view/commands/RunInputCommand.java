package view.commands;

import controller.Controller;
import model.expressions.ArithExp;
import model.expressions.ConstExp;
import model.expressions.IExp;
import model.expressions.VarExp;
import model.statements.*;

import java.util.Scanner;

public class RunInputCommand extends Command {

    public RunInputCommand(String key, String description, Controller controller) {
        super(key, description, controller);
    }

    @Override
    public void execute() {
        controller.newProgram(inputStatement());
    }

    private IStmt inputStatement() {
        int statementNr = getStatementNr();

        switch(statementNr) {
            case(1):
                //Assign statement
                return new AssignStmt(
                        getInputString("Variable name"),
                        inputExpression());
            case(2):
                //Comp
                return new CompStmt(
                        inputStatement(),
                        inputStatement()
                );
            case(3):
                //If
                return new IfStmt(
                        inputExpression(),
                        inputStatement(),
                        inputStatement()
                );
            case(4):
                //Print
                return new PrintStmt(
                        inputExpression()
                );
        }
        return null;
    }

    private IExp inputExpression() {
        int expressionNR =getExpressionNr();

        switch(expressionNR) {
            case(1):
                //Constant
                return new ConstExp( Integer.valueOf(getInputString("Constant: ")) );
            case(2):
                //Variable
                return new VarExp( getInputString("Variable name: "));
            case(3):
                //Arithmetic
                IExp left = inputExpression();
                char[] operator = getInputString("Operator: ").toCharArray();
                IExp right = inputExpression();
                return new ArithExp(
                        operator[0],
                        left,
                        right
                );
        }
        return null;
    }

    private int getStatementNr() {
        String out = new String();

        out += "1. Assign \n";
        out += "2. Comp \n";
        out += "3. If \n";
        out += "4. Print \n";

        System.out.println(out);

        Scanner sc = new Scanner(System.in);
        int command = sc.nextInt();

        if(command >= 1 && command <= 4)
            return command;

        return 0;
    }

    private int getExpressionNr() {
        String out = new String();

        out += "1. Constant \n";
        out += "2. Variable \n";
        out += "3. Arithmetic \n";

        System.out.println(out);

        Scanner sc = new Scanner(System.in);
        int command = sc.nextInt();

        if(command >= 1 && command <= 3)
            return command;

        return 0;
    }

    private String getInputString(String msg) {
        System.out.println(msg);

        String str;
        Scanner sc = new Scanner(System.in);
        str = sc.nextLine();

        return str;
    }
}