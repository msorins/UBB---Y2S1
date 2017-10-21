package model;

public class Eggplant extends Product {
    private String origin;

    public Eggplant(double weight, String origin) {
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
        if(obj instanceof Eggplant) {
            Eggplant y = (Eggplant) obj;

            return this.origin.equals(y.origin) && this.getWeight() == y.getWeight();
        }

        return false;
    }

    @Override
    public String toString() {
        return "Eggplant " + origin + " " + getWeight();
    }


}
