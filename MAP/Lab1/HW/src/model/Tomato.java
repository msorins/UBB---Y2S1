package model;
import model.Product;

public class Tomato extends Product {
    private String origin;

    public Tomato(double weight, String origin) {
        super(weight);
        this.origin = origin;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    @Override
    public boolean equals(Object obj) {
        if(obj instanceof Tomato) {
            Tomato y = (Tomato) obj;

            return this.origin.equals(y.origin) && this.getWeight() == y.getWeight();
        }

        return false;
    }

    @Override
    public String toString() {
        return "Tomato " + origin + " " + getWeight();
    }
}
