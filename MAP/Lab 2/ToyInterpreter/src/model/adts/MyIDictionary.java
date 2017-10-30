package model.adts;

import exceptions.AdtExceptions;

import java.util.Collection;
import java.util.Set;

public interface MyIDictionary<K, V> {
    void insert(K key, V value);
    void update(K key, V value);
    boolean find(K key);
    V erase(K key) throws AdtExceptions;
    V get(K key) throws AdtExceptions;
    boolean empty();
    int size();
    int sizeMax();
    String toString();
    Set<K> getKeys();
    Collection<V> getValues();

}
