package exceptions;

public class AdtExceptions extends Exception {
    private String msg;

    public AdtExceptions(String msg) {
        this.msg = msg;
    }

    public String getMsg() {
        return this.msg;
    }
}