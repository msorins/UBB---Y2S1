package view.fx;

import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

public class ProcTableDataFX {
    private StringProperty name;
    private StringProperty body;

    public ProcTableDataFX() {
        this.name = new SimpleStringProperty();
        this.body = new SimpleStringProperty();
    }

    public ProcTableDataFX(String name, String body) {
        this.name = new SimpleStringProperty();
        this.body = new SimpleStringProperty();

        this.name.setValue(name);
        this.body.setValue(body);
    }

    public String getName() {
        return name.get();
    }

    public StringProperty nameProperty() {
        return name;
    }

    public void setName(String name) {
        this.name.set(name);
    }

    public String getBody() {
        return body.get();
    }

    public StringProperty bodyProperty() {
        return body;
    }

    public void setBody(String body) {
        this.body.set(body);
    }
}
