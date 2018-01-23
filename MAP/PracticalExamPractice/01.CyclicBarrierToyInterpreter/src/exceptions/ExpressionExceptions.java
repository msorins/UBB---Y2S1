package exceptions;

public class ExpressionExceptions extends Exception {
    private String msg;

    public ExpressionExceptions(String msg) {
        this.msg = msg;
    }

    public String getMsg() {
        return this.msg;
    }
}