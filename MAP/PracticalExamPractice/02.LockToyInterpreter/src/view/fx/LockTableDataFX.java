package view.fx;

import javafx.beans.property.IntegerProperty;
import javafx.beans.property.SimpleIntegerProperty;

public class LockTableDataFX {
    private IntegerProperty lockindex;
    private IntegerProperty lockby;

    public LockTableDataFX() {
        this.lockindex = new SimpleIntegerProperty();
        this.lockby = new SimpleIntegerProperty();
    }

    public LockTableDataFX(Integer lockindex, Integer lockby) {
        this.lockindex = new SimpleIntegerProperty();
        this.lockby = new SimpleIntegerProperty();

        this.lockindex.setValue(lockindex);
        this.lockby.setValue(lockby);
    }

    public IntegerProperty getLockindex() {
        return lockindex;
    }

    public void setLockindex(IntegerProperty lockindex) {
        this.lockindex = lockindex;
    }

    public IntegerProperty getLockby() {
        return lockby;
    }

    public void setLockby(IntegerProperty lockby) {
        this.lockby = lockby;
    }
}
