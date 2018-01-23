package view.fx;

import javafx.beans.property.IntegerProperty;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

public class FileTableDataFX {
    private IntegerProperty identifier;
    private StringProperty filename;

    public FileTableDataFX() {
        this.identifier = new SimpleIntegerProperty();
        this.filename = new SimpleStringProperty();
    }

    public FileTableDataFX(Integer identifier, String filename) {
        this.identifier = new SimpleIntegerProperty();
        this.filename = new SimpleStringProperty();

        this.identifier.setValue(identifier);
        this.filename.setValue(filename);
    }

    public int getIdentifier() {
        return identifier.get();
    }

    public IntegerProperty identifierProperty() {
        return identifier;
    }

    public void setIdentifier(int identifier) {
        this.identifier.set(identifier);
    }

    public String getFilename() {
        return filename.get();
    }

    public StringProperty filenameProperty() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename.set(filename);
    }
}
