package cexception;

public class CException extends Exception {
    private String msg;

    public CException(String msg) {
        this.msg = msg;
    }

    public String getMsg() {
        return this.msg;
    }
}
