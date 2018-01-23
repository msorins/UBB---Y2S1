package view.fx;


import controller.Controller;
import exceptions.AdtExceptions;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.ListView;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.text.Text;
import model.adts.MyList;
import model.state.CyclicBarrierData;
import model.state.FileTableData;
import model.state.PrgState;
import model.statements.IStmt;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

public class FXUIController {
    private Controller toyController;
    private ArrayList<IStmt> programs;
    private int selectedProgram = 0;

    @FXML
    private ListView<String> programsList;

    @FXML
    private TableView symTable;

    @FXML
    private TableColumn<SymTableDataFX, String> symTableVar;

    @FXML
    private TableColumn<SymTableDataFX, Integer> symTableValue;


    @FXML
    private TableView heapTable;

    @FXML
    private TableColumn<HeapTableDataFX, Integer> heapTableAddress;

    @FXML
    private TableColumn<HeapTableDataFX, Integer> heapTableValue;

    @FXML
    private ListView<String> exeStackListView;

    @FXML
    private TableView fileTable;

    @FXML
    private TableColumn<FileTableDataFX, Integer> fileTableIdentifier;

    @FXML
    private TableColumn<FileTableDataFX, String> fileTableFileName;

    @FXML
    private TableView barrierTable;

    @FXML
    private TableColumn<BarrierTableDataFX, Integer> barrierTableLocation;

    @FXML
    private TableColumn<BarrierTableDataFX, String> barrierTableThreads;

    @FXML
    private TableColumn<BarrierTableDataFX, Integer> barrierTableValue;

    @FXML
    private ListView<Integer> prgStatesListView;

    @FXML
    public Button oneStepButton;

    @FXML
    private ListView<Integer> outListView;

    @FXML
    private Text textProgramStates;


    @FXML
    private void OneStepButtonAction(ActionEvent e) {

    }


    public FXUIController() {

    }

    @FXML
    void initialize() {
        //OnClick for programsList
        this.programsList.getSelectionModel().selectedItemProperty().addListener( (observable, oldValue, newValue) -> {
            setNewProgram( this.programsList.getSelectionModel().getSelectedIndex() );
        } );

        //OnClick for button
        this.oneStepButton.setOnAction(new EventHandler<ActionEvent>() {
            @Override
            public void handle(ActionEvent event) {
                oneStepButtonClicked();
            }
        });

        //OnClick for prgStates
        this.prgStatesListView.getSelectionModel().selectedItemProperty().addListener( (observable, oldValue, newValue ) -> {
            if(this.prgStatesListView.getSelectionModel().getSelectedIndex() != -1)
                setNewSelectedProgram( this.prgStatesListView.getSelectionModel().getSelectedIndex() );
        });

    }

    @FXML
    public void setPrgStatesListViewItems(ArrayList<String> lst) {
        ObservableList<String> programsItems =  FXCollections.observableArrayList();
        programsItems.addAll(lst);


        this.programsList.setItems( programsItems );
    }

    public void setToyController(Controller toyController) {
        this.toyController = toyController;
    }

    @FXML
    public void setOutListView() {
        ObservableList<Integer> outItems =  FXCollections.observableArrayList();

        try {
            MyList<Integer> items = (MyList<Integer> ) this.toyController.getPrograms().getAt(0).getOut();
            outItems.addAll(  items.getData() );

            if(items != null && outListView != null)
                this.outListView.setItems( outItems );
        } catch (AdtExceptions adtExceptions) {
            adtExceptions.printStackTrace();
        }

    }

    @FXML
    public void setOutPrgStatesListView() {
        ObservableList<Integer> prgStatesItems =  FXCollections.observableArrayList();

        MyList<PrgState> prgs = this.toyController.getPrograms();
        for(int i = 0; i < prgs.size(); i++)
            try {
                prgStatesItems.add( prgs.getAt(i).getId() );
            } catch (AdtExceptions adtExceptions) {
                adtExceptions.printStackTrace();
            }

        if( prgs != null && prgStatesListView != null)
            this.prgStatesListView.setItems( prgStatesItems );
    }

    @FXML
    public void setOutHeapTable() {
        ObservableList<HeapTableDataFX> data = FXCollections.observableArrayList();
        HashMap<Integer, Integer> heapTableToy = null;
        try {
            heapTableToy = this.toyController.getPrograms().getAt(0).getHeap().getData();
        } catch (AdtExceptions adtExceptions) {
            adtExceptions.printStackTrace();
        }

        heapTableValue.setCellValueFactory( heapTableData -> heapTableData.getValue().getValue().asObject() );
        heapTableAddress.setCellValueFactory( heapTableData -> heapTableData.getValue().getAddress().asObject() );


        for(Integer key : heapTableToy.keySet()) {
            Integer value =  heapTableToy.get(key);
            data.add(new HeapTableDataFX(key, value));
        }

        if( heapTableToy != null && heapTable != null)
            heapTable.setItems( data );
    }

    @FXML
    public void setOutFileTable() {
        ObservableList<FileTableDataFX> data = FXCollections.observableArrayList();
        HashMap<Integer, FileTableData> fileTableToy = null;

        fileTableToy = this.toyController.getPrograms().getData().get(0).getFileTable().getData();

        for(Integer key : fileTableToy.keySet()) {
            String fileName =  fileTableToy.get(key).filename;
            data.add(new FileTableDataFX(key, fileName));
        }

        fileTableIdentifier.setCellValueFactory( fileTableData -> fileTableData.getValue().identifierProperty().asObject() );
        fileTableFileName.setCellValueFactory( fileTableData -> fileTableData.getValue().filenameProperty() );


        if(fileTableToy != null && fileTable != null)
            fileTable.setItems( data );
    }

    @FXML
    public void setOutNumberOfProgramStates() {
        int states = toyController.getPrograms().size();

        textProgramStates.setText(  "" + states );
    }

    @FXML
    public void setOutExeStackListView() {
        ObservableList<String> exeStackItems =  FXCollections.observableArrayList();
        LinkedList<IStmt> executionStackToy = null;

        try {
            if(selectedProgram <= this.toyController.getPrograms().size() + 1)
                executionStackToy = this.toyController.getPrograms().getAt(selectedProgram).getExeStack().getData();
            else
                executionStackToy = new LinkedList<IStmt>();

        } catch (AdtExceptions adtExceptions) {

        }

        if(executionStackToy != null && exeStackListView != null) {
            for(int i = 0; i < executionStackToy.size(); i++) {
                exeStackItems.add(  executionStackToy.get(i).toString() );
            }

            exeStackListView.setItems( exeStackItems );
        }

    }

    @FXML
    public void setOutSymTable() {
        ObservableList<SymTableDataFX> symItems = FXCollections.observableArrayList();
        HashMap<String, Integer> symTableToy = null;

        try {
            if(selectedProgram <= this.toyController.getPrograms().size() + 1)
                symTableToy = this.toyController.getPrograms().getAt(selectedProgram).getSymTable().getData();
            else
                symTableToy = new HashMap<String, Integer>();
        } catch (AdtExceptions adtExceptions) {

        }


        symTableVar.setCellValueFactory( symTableData -> symTableData.getValue().varProperty() );
        symTableValue.setCellValueFactory( symTableData -> symTableData.getValue().valueProperty().asObject());

        if(symTableToy != null && symTable != null) {

            for(String key : symTableToy.keySet()) {
                int value = symTableToy.get(key);

                symItems.add( new SymTableDataFX(key, value) );
            }

            symTable.setItems( symItems );

        }
    }

    @FXML
    public void setOutBarrierTable() {
        ObservableList<BarrierTableDataFX> data = FXCollections.observableArrayList();
        HashMap<Integer, CyclicBarrierData> barrierTableToy = null;

        try {
            barrierTableToy = this.toyController.getPrograms().getAt(0).getBarrierTable().getData();
        } catch (AdtExceptions adtExceptions) {
            adtExceptions.printStackTrace();
        }

        barrierTableLocation.setCellValueFactory( barrierTableData-> barrierTableData.getValue().locationProperty().asObject() );
        barrierTableThreads.setCellValueFactory( barrierTableData-> barrierTableData.getValue().threadsProperty() );
        barrierTableValue.setCellValueFactory( barrierTableData-> barrierTableData.getValue().valueProperty().asObject() );


        assert barrierTableToy != null;
        for(Integer key : barrierTableToy.keySet()) {
            CyclicBarrierData value =  barrierTableToy.get(key);

            data.add(new BarrierTableDataFX(key, value.getThreadIdentifiers().toString(), value.getBarrierValue()));
        }

        if( barrierTableToy != null && barrierTable != null)
            barrierTable.setItems( data );

    }

    private void oneStepButtonClicked() {
        try {
            this.toyController.oneStepForAll( (List<PrgState>)  this.toyController.getPrograms().getData() );
            updateAllData();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public void updateAllData() {
        setOutNumberOfProgramStates();
        setOutListView();
        setOutPrgStatesListView();
        setOutHeapTable();
        setOutFileTable();
        setOutExeStackListView();
        setOutSymTable();
        setOutBarrierTable();
    }

    public void setNewProgram(int index) {
        this.toyController = new Controller("log.txt");
        try {
            toyController.addProgram(  this.programs.get(index) );
            selectedProgram = 0;
            updateAllData();
        } catch (Exception e) {
            e.printStackTrace();
        }

        updateAllData();
    }

    public void setPrograms(ArrayList<IStmt> programs) {
        this.programs = programs;
    }

    public void setNewSelectedProgram(int newSelectedProgram) {
        this.selectedProgram = newSelectedProgram;
        updateAllData();
    }
}
