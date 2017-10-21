package model.adts;

import exceptions.AdtExceptions;

import java.util.ArrayList;

public class MyList<T> implements  MyIList<T>{
    private ArrayList<T> data;

    public MyList() {
        data = new ArrayList<T>();
    }

    @Override
    public void push_back(T elem) {
        data.add(elem);
    }

    @Override
    public int size() {
        return data.size();
    }

    @Override
    public T getAt(int pos) throws AdtExceptions {
        if(pos < 0 || pos >= size())
            throw new AdtExceptions("Position not valid");

        return data.get(pos);
    }

    @Override
    public void insertAt(int pos, T elem) throws AdtExceptions {
        //To check here
        if(pos < 0 || pos > size())
            throw new AdtExceptions("Position not valid");

        data.add(pos, elem);
    }

    @Override
    public void removeAt(int pos) throws AdtExceptions {
        if(pos < 0 || pos >= size())
            throw new AdtExceptions("Position not valid");

        data.remove(pos);
    }

    @Override
    public void remove(T elem) throws AdtExceptions {
        if(!data.contains(elem))
            throw new AdtExceptions("Element not found");

        data.remove(elem);
    }

    @Override
    public String toString() {
        String res = "";
        for(int i = 0; i < data.size(); i++)
            res += data.get(i) + " ";

        return res;
    }
}
