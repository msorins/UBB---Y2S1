package controller;

import exceptions.AdtExceptions;
import model.adts.MyIDictionary;
import model.adts.MyIStack;
import model.adts.MyList;
import model.state.FileTableData;
import model.state.PrgState;
import model.state.ProcTableData;
import model.statements.IStmt;
import repository.IRepository;
import repository.IRepositoryLog;
import repository.Repository;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.stream.Collectors;

public class Controller implements IController, IRepository {
    IRepositoryLog repo;
    private ExecutorService executor;
    public Controller(IRepositoryLog repo) {
        this.repo = repo;
    }

    public Controller() {
        repo = new Repository();
        executor = Executors.newFixedThreadPool(2);
    }

    public Controller(String log) {
        repo = new Repository(log);
        executor = Executors.newFixedThreadPool(2);
    }

    @Override
    public void oneStepForAll(List<PrgState> prgList) throws InterruptedException {
        //Print logs
        prgList.forEach(prg -> {
            try {
                repo.logPrgStateExec(prg);
            } catch (IOException e) {
                e.printStackTrace();
            } catch (AdtExceptions adtExceptions) {
                adtExceptions.printStackTrace();
            }
        });

        //RUN CONCURRENTLY

        //prepare the list of callables
        List< Callable<PrgState> > callList = prgList.stream()
                .map((PrgState p) -> (Callable<PrgState>)(() -> {

            int a = 3;
            int b = 4;
            int c = a + b;
            return p.oneStep();

        }))
                .collect(Collectors.toList());

        //start the execution of the callbacks
        List<PrgState> newPrgList = executor.invokeAll(callList). stream()
                . map(future -> {
                    try {
                        return future.get();
                    }

                    catch(Exception e) {
                        System.out.println(e);
                    }
                    return null;
                })
                .filter(p -> {
                    int a = 3;
                    int b = 4;
                    int c = a + b;

                    return p!=null;
                })
                .collect(Collectors.toList());

        //add the new created threads to the list of existing threads
        prgList.addAll(newPrgList);

        //after the execution, print the PrgState List into the log file
        prgList.forEach(prg -> {
            try {
                repo.logPrgStateExec(prg);
            } catch (IOException e) {
                e.printStackTrace();
            } catch (AdtExceptions adtExceptions) {
                adtExceptions.printStackTrace();
            }
        });

        //Save the current programs in the repository
        MyList<PrgState> myPrgList = new MyList<PrgState>((ArrayList<PrgState>) prgList);
        repo.setPrograms(myPrgList);
    }

    public void allStep() throws InterruptedException {

        //remove the completed programs
        List<PrgState> prgList=removeCompletedPrg((List<PrgState>) repo.getPrograms().getData());
        while(prgList.size() > 0) {
            oneStepForAll(prgList);

            //remove the completed programs
            prgList = removeCompletedPrg((List<PrgState>) repo.getPrograms().getData() );
        }

        executor.shutdownNow();

        // update the repository state
        MyList<PrgState> myPrgList = new MyList<PrgState>((ArrayList<PrgState>) prgList);
        repo.setPrograms(myPrgList);
    }

    @Override
    public String display(PrgState state) {
        return state.toString();
    }

    @Override
    public String display(int index) {
        return repo.getPrograms().toString();
    }

    @Override
    public void programEndingFileGarbageCollector(MyIDictionary<Integer, FileTableData> fileTable) {
        fileTable.entrySet().stream().forEach(elem -> {
            try {
                elem.getValue().bufferedReader.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        });
    }

    @Override
    public HashMap<Integer, Integer> conservativeGarbageCollector(MyIDictionary<String, Integer> symTable, MyIDictionary<Integer, Integer> heap) {
        return (HashMap<Integer, Integer>) heap.entrySet().stream()
                .filter( e -> symTable.getValues().contains(e.getKey()) )
                .collect( Collectors.toMap( Map.Entry::getKey,  Map.Entry::getValue ));
    }

    @Override
    public List<PrgState> removeCompletedPrg(List<PrgState> inPrgList) {
        return inPrgList.stream()
                .filter(p->p.isNotCompleted())
                .collect(Collectors.toList());
    }

    @Override
    public MyList<PrgState> getPrograms() {
        return repo.getPrograms();
    }

    @Override
    public void setPrograms(MyList<PrgState> programs) {
        repo.setPrograms(programs);
    }

    @Override
    public PrgState addProgram(IStmt stmt) throws Exception {
        return repo.addProgram(stmt);
    }

    @Override
    public PrgState addProgramWithProc(IStmt stmt, MyIDictionary<String, ProcTableData> procTable) throws Exception {
        return repo.addProgramWithProc(stmt, procTable);
    }
}
