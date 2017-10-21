package model.expressions;

import exceptions.ExpressionExceptions;
import model.adts.MyIDictionary;

public class ArithExp implements IExp{
    private IExp leftSide, rightSide;
    private char operator;

    public ArithExp(char operator, IExp leftSide, IExp rightSide) {
        this.operator = operator;
        this.leftSide = leftSide;
        this.rightSide = rightSide;
    }

    @Override
    public int eval(MyIDictionary<String, Integer> d) throws Exception {
        int evalLeft = this.leftSide.eval(d);
        int evalRight = this.rightSide.eval(d);

        switch (operator) {
            case('+'):
                return evalLeft + evalRight;
            case('-'):
                return evalLeft - evalRight;
            case('*'):
                return evalLeft * evalRight;
            case('/'):
                if(evalRight == 0)
                    throw new ExpressionExceptions("Division by 0");

                return evalLeft / evalRight;
        }

        throw new Exception("Invalid operator");
    }

    @Override
    public String toString() {
        return leftSide.toString() + " " + operator + " " +  rightSide.toString();
    }
}
