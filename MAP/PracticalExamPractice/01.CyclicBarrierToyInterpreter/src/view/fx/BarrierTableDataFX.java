package view.fx;

import javafx.beans.property.IntegerProperty;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

public class BarrierTableDataFX {
    private IntegerProperty location;
    private StringProperty threads;
    private IntegerProperty value;


    public BarrierTableDataFX() {
        location = new SimpleIntegerProperty();
        threads = new SimpleStringProperty();
        value = new SimpleIntegerProperty();
    }

    public BarrierTableDataFX(Integer l, String t, Integer v) {
        this();

        location.setValue(l);
        threads.setValue(t);
        value.setValue(v);
    }

    public int getLocation() {
        return location.get();
    }

    public IntegerProperty locationProperty() {
        return location;
    }

    public void setLocation(int location) {
        this.location.set(location);
    }

    public String getThreads() {
        return threads.get();
    }

    public StringProperty threadsProperty() {
        return threads;
    }

    public void setThreads(String threads) {
        this.threads.set(threads);
    }

    public int getValue() {
        return value.get();
    }

    public IntegerProperty valueProperty() {
        return value;
    }

    public void setValue(int value) {
        this.value.set(value);
    }
}
