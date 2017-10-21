package model.expressions;

import model.adts.MyIDictionary;

public interface IExp {
    public int eval(MyIDictionary<String, Integer> d) throws Exception;
}
