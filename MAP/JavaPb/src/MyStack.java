import java.util.Arrays;

public class MyStack {
    private int maxSize;
    private char[] stackArray;
    private int top;

    public MyStack(int s) {
        maxSize = s;
        stackArray = new char[maxSize];
        top = -1;
    }
    public void push(char j) {
        stackArray[++top] = j;
    }
    public long pop() {
        stackArray[top] = '\0';
        return stackArray[top--];
    }
    public char peek() {
        return stackArray[top];
    }
    public boolean isEmpty() {
        return (top == -1);
    }
    public boolean isFull() {
        return (top == maxSize - 1);
    }

    @Override
    public String toString() {
        return "[ " + Arrays.toString(stackArray) + " ]";
    }
}