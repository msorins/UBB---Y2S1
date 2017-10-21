public class Apple extends Product {
    private String color, type;

    public Apple(int weight, String color, String type) {
        super(weight);

        this.color = color;
        this.type = type;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "Apple " + this.type + " " + this.color + " " + this.getWeight();
    }

    @Override
    public boolean equals(Object obj) {
        if(obj instanceof Apple) {
            Apple y = (Apple) obj;

            return this.color.equals(y.color) && this.type.equals(y.type) && this.getWeight() == y.getWeight();
        }

        return false;
    }
}
