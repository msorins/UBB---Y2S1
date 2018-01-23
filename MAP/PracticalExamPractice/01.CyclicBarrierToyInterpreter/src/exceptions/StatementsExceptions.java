package exceptions;

public class StatementsExceptions extends Exception {
    private String msg;

    public StatementsExceptions(String msg) {
        this.msg = msg;
    }

    public String getMsg() {
        return this.msg;
    }
}
