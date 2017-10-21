package model.adts;

import exceptions.AdtExceptions;

import java.util.LinkedList;

public class MyStack<T> implements MyIStack<T> {
    private LinkedList<T>  data;

    public MyStack() {
        data = new LinkedList<>();
    }

    @Override
    public T top() throws AdtExceptions {
        if(empty())
            throw new AdtExceptions("Stack is empty");

        return data.getFirst();
    }

    @Override
    public T pop() throws AdtExceptions {
        if(empty())
            throw new AdtExceptions("Stack is empty");

        return data.removeFirst();
    }

    @Override
    public void push(T elem) {
        data.addFirst(elem);
    }

    @Override
    public boolean empty() {
        return data.isEmpty();
    }

    @Override
    public String toString() {
        String output = new String("[ ");
        LinkedList<T> auxData = new LinkedList<>(data);

        while(!auxData.isEmpty()) {
            if (output.length() > 2)
                output += ", ";

            output += auxData.pop();
        }

        output += " ]";

        return output;
    }
}
