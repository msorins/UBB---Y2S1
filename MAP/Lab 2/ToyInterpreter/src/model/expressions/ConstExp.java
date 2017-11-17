package model.expressions;

import model.adts.MyIDictionary;

public class ConstExp implements IExp {
    private int value;

    public ConstExp(int value) {
        this.value = value;
    }

    @Override
    public int eval(MyIDictionary<String, Integer> d, MyIDictionary<Integer, Integer> h) {
        return this.value;
    }

    @Override
    public String toString() {
        return " " + value;
    }
}

