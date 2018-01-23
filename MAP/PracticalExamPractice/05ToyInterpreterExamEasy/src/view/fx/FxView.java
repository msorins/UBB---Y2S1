package view.fx;

import controller.Controller;
import javafx.application.Application;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.fxml.FXMLLoader;
import javafx.geometry.Orientation;
import javafx.scene.Scene;
import javafx.scene.control.ListView;
import javafx.scene.layout.Pane;
import javafx.stage.Stage;
import model.expressions.*;
import model.statements.*;

import java.util.ArrayList;

public class FxView extends Application{
    Controller toyController;
    FXUIController fxUIcontroller;

    ArrayList<IStmt> programs;
    ArrayList<String> programNames;

    public FxView() {
        populatePrograms();

        this.toyController = new Controller("log.txt");
        try {
            toyController.addProgram( programs.get(0) );
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void populatePrograms() {
        IStmt ex1 = new CompStmt(new AssignStmt("v",new ConstExp(2)), new PrintStmt(new VarExp("v")));
        IStmt ex2 = new CompStmt(new AssignStmt("a", new ArithExp('+',new ConstExp(2),new
                ArithExp('*',new ConstExp(3), new ConstExp(5)))),
                new CompStmt(new AssignStmt("b",new ArithExp('+',new VarExp("a"), new
                        ConstExp(1))), new PrintStmt(new VarExp("b"))));

        IStmt ex3 = new CompStmt(new AssignStmt("a", new ArithExp('-',new ConstExp(2), new
                ConstExp(2))),
                new CompStmt(new IfStmt(new VarExp("a"),new AssignStmt("v",new ConstExp(2)), new
                        AssignStmt("v", new ConstExp(3))), new PrintStmt(new VarExp("v"))));

        IStmt ex4 = new CompStmt(
                new OpenRFileStmt("var_f", "/Users/so/Desktop/Y2S2/MAP/Lab 2/ToyInterpreter/files/test.in"),
                new CompStmt(
                        new ReadFileStmt(new ConstExp(0), "var_c"),
                        new PrintStmt(new VarExp("var_c"))

                )
        );

        IStmt ex5 = new CompStmt(
                new AssignStmt("v", new ConstExp(10)),
                new CompStmt(
                        new NewStmt("v", new ConstExp(20)),
                        new CompStmt(
                                new NewStmt("a", new ConstExp(22)),
                                new CompStmt(
                                        new PrintStmt(new ArithExp('+', new ConstExp(100), new rHExp("v"))),
                                        new PrintStmt(new ArithExp('+', new ConstExp(100), new rHExp("a")))
                                )
                        )
                )
        );

        IStmt ex6 = new CompStmt(
                new AssignStmt("v", new ConstExp(10)),
                new CompStmt(
                        new NewStmt("v", new ConstExp(20)),
                        new CompStmt(
                                new NewStmt("a", new ConstExp(22)),
                                new CompStmt(new wHStmt("a", new ConstExp(30)),
                                        new CompStmt(
                                                new PrintStmt(new VarExp("a")),
                                                new PrintStmt(new rHExp("a"))
                                        )
                                )
                        )
                )
        );

        IStmt ex7 = new CompStmt(
                new AssignStmt("v", new ConstExp(10)),
                new CompStmt(
                        new NewStmt("v", new ConstExp(20)),
                        new CompStmt(
                                new NewStmt("a", new ConstExp(22)),
                                new CompStmt(new wHStmt("a", new ConstExp(30)),
                                        new CompStmt(
                                                new PrintStmt(new VarExp("a")),
                                                new CompStmt(
                                                        new PrintStmt(new rHExp("a")),
                                                        new AssignStmt("a", new ConstExp(0))
                                                )
                                        )
                                )
                        )
                )
        );

        IStmt ex8 = new CompStmt(
                new AssignStmt("v", new ArithExp('+',
                        new ConstExp(10),
                        new BooleanExp("<", new ConstExp(2), new ConstExp(6)))),
                new PrintStmt(new VarExp("v"))
        );

        IStmt ex9 = new CompStmt(
                new AssignStmt("v", new ConstExp(6)),
                new CompStmt(
                        new WhileStmt(
                                new ArithExp('-', new VarExp("v"), new ConstExp(4)),
                                new AssignStmt("v", new ArithExp('-', new VarExp("v"), new ConstExp(1)))),
                        new PrintStmt(new VarExp("v"))
                )
        );

        IStmt ex10_fork = new CompStmt(
                new wHStmt("a", new ConstExp(30)),
                new CompStmt(
                        new AssignStmt("v", new ConstExp(32)),
                        new CompStmt(
                                new PrintStmt(new VarExp("v")),
                                new PrintStmt(new rHExp("a"))
                        )
                )
        );
        IStmt ex10 = new CompStmt(
                new AssignStmt("v", new ConstExp(10)),
                new CompStmt(
                        new NewStmt("a", new ConstExp(22)),
                        new CompStmt(
                                new ForkStmt(ex10_fork),
                                new CompStmt(
                                        new PrintStmt(new VarExp("v")),
                                        new PrintStmt(new rHExp("a"))
                                )
                        )
                )
        );


        IStmt ex11_fork = new CompStmt(
                new AssignStmt("b", new ConstExp(20)),
                new PrintStmt(new VarExp("b"))
        );

        IStmt ex11 = new CompStmt(
                new AssignStmt("a", new ConstExp(10)),
                new CompStmt(
                        new ForkStmt( ex11_fork ),
                        new PrintStmt(new VarExp("a"))
                )
        );

        programs = new ArrayList<IStmt>(); programNames = new ArrayList<String>();
        programs.add(ex1); programNames.add(ex1.toString());
        programs.add(ex2); programNames.add(ex2.toString());
        programs.add(ex3); programNames.add(ex3.toString());
        programs.add(ex4); programNames.add(ex4.toString());
        programs.add(ex5); programNames.add(ex5.toString());
        programs.add(ex6); programNames.add(ex6.toString());
        programs.add(ex7); programNames.add(ex7.toString());
        programs.add(ex8); programNames.add(ex8.toString());
        programs.add(ex9); programNames.add(ex9.toString());
        programs.add(ex10); programNames.add(ex10.toString());
        programs.add(ex11); programNames.add(ex11.toString());
    }

    @Override
    public void start(Stage primaryStage) throws Exception {
        //Create a Scene
        FXMLLoader loader = new FXMLLoader(getClass().getResource("FXUI.fxml"));
        Pane pane = (Pane) loader.load();

        fxUIcontroller  = loader.getController();
        fxUIcontroller.setToyController(toyController);
        fxUIcontroller.setPrograms(programs);
        fxUIcontroller.setPrgStatesListViewItems(programNames);
        fxUIcontroller.updateAllData();


        //Setting the title to Stage.
        primaryStage.setTitle("Sample application");

        //Setting the scene to Stage
        primaryStage.setScene( new Scene(pane) );

        //Displaying the stage
        primaryStage.show();
    }

}
