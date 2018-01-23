package view.fx;

import javafx.beans.property.IntegerProperty;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

public class SymTableDataFX {
    private StringProperty var;
    private IntegerProperty value;

    public SymTableDataFX() {
        this.var = new SimpleStringProperty();
        this.value = new SimpleIntegerProperty();
    }

    public SymTableDataFX(String var, Integer value) {
        this.var = new SimpleStringProperty();
        this.value = new SimpleIntegerProperty();

        this.var.setValue( var );
        this.value.setValue( value );
    }

    public String getVar() {
        return var.get();
    }

    public StringProperty varProperty() {
        return var;
    }

    public void setVar(String var) {
        this.var.set(var);
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
