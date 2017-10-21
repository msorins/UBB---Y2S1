package model.adts;

import exceptions.AdtExceptions;

import java.util.HashMap;
import java.util.Iterator;

public class MyDictionary<K, V> implements MyIDictionary<K, V> {
    private HashMap<K, V> data;

    public MyDictionary() {
        data = new HashMap<K, V>();
    }

    @Override
    public void insert(K key, V value) {
        data.put(key, value);
    }

    @Override
    public void update(K key, V value) {
        insert(key, value);
    }

    @Override
    public boolean find(K key) {
        return data.containsKey(key);
    }

    @Override
    public V erase(K key) throws AdtExceptions {
        if(!find(key))
            throw new AdtExceptions("Key not found");

        return data.remove(key);
    }

    @Override
    public boolean empty() {
        return data.isEmpty();
    }

    @Override
    public int size() {
        return data.size();
    }

    @Override
    public V get(K key) throws AdtExceptions {
        if(!find(key))
            throw new AdtExceptions("Key not found");
        return data.get(key);
    }

    @Override
    public String toString() {
        String output = new String("{ ");
        Iterator it = data.entrySet().iterator();

        for (K key : data.keySet()) {
            if(output.length() > 2)
                output += ", ";

            output += key + ": " + data.get(key);
        }

        output += " }";

        return output;
    }
}
