package model.expressions;

import model.adts.MyIDictionary;

public class VarExp implements IExp {
    private String expr;

    public VarExp(String expr) {
        this.expr = expr;
    }

    @Override
    public int eval(MyIDictionary<String, Integer> d) throws Exception {
       if(d.find(expr))
           return d.get(expr);

       throw new Exception("Variable not found");
    }

    @Override
    public String toString() {
        return expr;
    }
}
