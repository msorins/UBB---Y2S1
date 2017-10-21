package view;

import controller.Controller;
import model.expressions.ArithExp;
import model.expressions.ConstExp;
import model.expressions.IExp;
import model.expressions.VarExp;
import model.statements.*;
import repository.Repository;

import java.util.Scanner;

public class View {
    private Controller controller;

    public View(Controller controller) {
        this.controller = controller;
    }

    public View(Repository repository) {
        this.controller = new Controller(repository);
    }

    public View() {
        Repository repository = new Repository();
        controller = new Controller(repository);
    }

    public void newProgram(IStmt stmt) {
        controller.newProgram(stmt);
    }

    public IStmt inputStatement() {
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

    public IExp inputExpression() {
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

    public void executeOneStepAt(int index) throws Exception {
        controller.oneStep( controller.getProgramAt(index) );
    }

    public void executeAllStepsAt(int index) throws Exception {
        controller.allSteps( controller.getProgramAt(index) );
    }

    public void printPrograms() {
        for(int i = 0; i < controller.getPrograms().size(); i++)
            System.out.println( "" + i + ": " +controller.getProgramAt(i).toString()  );
    }

    public void printProgramAt(int index) {
        System.out.println( controller.getProgramAt(index).toString()  );
    }

    public void starProg() throws Exception {
        while(true) {
            printMenu();
            int cmd = getNr("nr: ");
            int index;
            switch (cmd) {
                case 1:
                    controller.newProgram(inputStatement());
                    break;
                case 2:
                    printPrograms();
                    break;
                case 3:
                    index = getNr("index: ");
                    executeOneStepAt(index);
                    printProgramAt(index);
                    break;
                case 4:
                    index = getNr("index: ");
                    executeAllStepsAt(index);
                    printProgramAt(index);
                    break;
                default:
                    return;
            }
        }
    }

    private void printMenu() {
        String str;
        str  = "\n1. Inpput Statement \n";
        str += "2. View Programs \n";
        str += "3. One step evaluation \n";
        str += "4. Complete evaluation \n";
        str += "5. Exit ";
        System.out.println(str);
    }

    private int getNr(String msg) {
        System.out.println(msg);

        Scanner sc = new Scanner(System.in);
        return sc.nextInt();
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
