package model.adts;

import exceptions.AdtExceptions;
import sun.awt.image.ImageWatched;

import java.util.LinkedList;

public interface MyIStack<T> {
    T top() throws AdtExceptions;
    T pop() throws AdtExceptions;
    void push(T elem);
    boolean empty();
    String toString();
    LinkedList<T> getData();
}
