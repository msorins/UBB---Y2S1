package model.expressions;

import model.adts.MyIDictionary;

public interface IExp {
    public int eval(MyIDictionary<String, Integer> d, MyIDictionary<Integer, Integer> h) throws Exception;
}
