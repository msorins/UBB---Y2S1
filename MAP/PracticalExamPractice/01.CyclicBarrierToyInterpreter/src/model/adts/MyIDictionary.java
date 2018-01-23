package model.adts;

import exceptions.AdtExceptions;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public interface MyIDictionary<K, V> {
    void insert(K key, V value) throws AdtExceptions;
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
    Set<Map.Entry<K, V>> entrySet();
    void setData(HashMap<K, V> mp);
    HashMap<K, V> getData();

}
