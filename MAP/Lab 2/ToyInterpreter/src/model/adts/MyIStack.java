package model.adts;

import exceptions.AdtExceptions;

public interface MyIStack<T> {
    T top() throws AdtExceptions;
    T pop() throws AdtExceptions;
    void push(T elem);
    boolean empty();
    String toString();
}
