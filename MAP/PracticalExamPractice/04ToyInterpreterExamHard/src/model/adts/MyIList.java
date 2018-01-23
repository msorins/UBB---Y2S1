package model.adts;

import exceptions.AdtExceptions;

import java.util.ArrayList;

public interface MyIList<T> {
    void push_back(T elem);
    int size();
    T getAt(int pos) throws AdtExceptions;
    void insertAt(int pos, T elem) throws AdtExceptions;
    void removeAt(int pos) throws AdtExceptions;
    void remove(T elem) throws AdtExceptions;
    String toString();
}
