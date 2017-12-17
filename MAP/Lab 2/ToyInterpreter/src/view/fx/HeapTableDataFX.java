package view.fx;

import javafx.beans.property.IntegerProperty;
import javafx.beans.property.SimpleIntegerProperty;

public class HeapTableDataFX {
    private IntegerProperty address;
    private IntegerProperty value;

    public HeapTableDataFX() {
        this.address = new SimpleIntegerProperty();
        this.value = new SimpleIntegerProperty();
    }

    public HeapTableDataFX(Integer address, Integer value) {
        this.address = new SimpleIntegerProperty();
        this.value = new SimpleIntegerProperty();

        this.address.setValue(address);
        this.value.setValue(value);
    }

    public IntegerProperty getAddress() {
        return address;
    }

    public void setAddress(IntegerProperty address) {
        this.address = address;
    }

    public IntegerProperty getValue() {
        return value;
    }

    public void setValue(IntegerProperty value) {
        this.value = value;
    }
}
