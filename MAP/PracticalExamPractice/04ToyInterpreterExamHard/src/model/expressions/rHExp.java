package model.expressions;
import model.adts.MyIDictionary;

public class rHExp implements IExp {
    private String varname;

    public rHExp(String varn) {
        this.varname = varn;
    }

    @Override
    public int eval(MyIDictionary<String, Integer> d, MyIDictionary<Integer, Integer> h) throws Exception {
        if(d.find(varname))
            if(h.find( d.get(varname) ) )
                return h.get( d.get(varname) );

        throw new Exception("Variable not found");
    }

    @Override
    public String toString() {
        return varname;
    }
}
