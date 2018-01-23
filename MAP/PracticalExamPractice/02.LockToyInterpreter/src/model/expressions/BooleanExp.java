package model.expressions;

import exceptions.ExpressionExceptions;
import model.adts.MyIDictionary;

public class BooleanExp implements IExp{
    private IExp leftSide, rightSide;
    private String operator;

    public BooleanExp(String operator, IExp leftSide, IExp rightSide) {
        this.operator = operator;
        this.leftSide = leftSide;
        this.rightSide = rightSide;
    }

    @Override
    public int eval(MyIDictionary<String, Integer> d, MyIDictionary<Integer, Integer> h) throws Exception {
        int evalLeft = this.leftSide.eval(d, h);
        int evalRight = this.rightSide.eval(d, h);

        if(operator.equals("<"))
            return  ( evalLeft < evalRight ) ? 1 : 0;

        if(operator.equals("<="))
            return  ( evalLeft <= evalRight ) ? 1 : 0;

        if(operator.equals(">"))
            return  ( evalLeft > evalRight ) ? 1 : 0;

        if(operator.equals(">="))
            return  ( evalLeft >= evalRight ) ? 1 : 0;

        if(operator.equals("<"))
            return  ( evalLeft < evalRight ) ? 1 : 0;

        if(operator.equals("=="))
            return  ( evalLeft == evalRight ) ? 1 : 0;

        if(operator.equals("!="))
            return  ( evalLeft != evalRight ) ? 1 : 0;

        throw new Exception("Invalid operator");
    }

    @Override
    public String toString() {
        return leftSide.toString() + " " + operator + " " +  rightSide.toString();
    }
}
