package model.state;

import java.util.ArrayList;

public class CyclicBarrierData {
    public ArrayList<Integer> threadIdentifiers;
    public int barrierValue;

    public CyclicBarrierData(ArrayList<Integer> threadIdentifiers, int barrierValue) {
        this.threadIdentifiers = threadIdentifiers;
        this.barrierValue = barrierValue;
    }

    public ArrayList<Integer> getThreadIdentifiers() {
        return threadIdentifiers;
    }

    public void setThreadIdentifiers(ArrayList<Integer> threadIdentifiers) {
        this.threadIdentifiers = threadIdentifiers;
    }

    public int getBarrierValue() {
        return barrierValue;
    }

    public void setBarrierValue(int barrierValue) {
        this.barrierValue = barrierValue;
    }
}
