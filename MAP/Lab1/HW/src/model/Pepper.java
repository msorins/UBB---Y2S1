package model;

public class Pepper extends Product {
    private String origin;

    public Pepper(double weight, String origin) {
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
        if(obj instanceof Pepper) {
            Pepper y = (Pepper) obj;

            return this.origin.equals(y.origin) && this.getWeight() == y.getWeight();
        }

        return false;
    }

    @Override
    public String toString() {
        return "Pepper " + origin + " " + getWeight();
    }
}
