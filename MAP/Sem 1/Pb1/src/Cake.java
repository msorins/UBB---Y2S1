public class Cake extends Product{
    private String topping, name;
    private int price;

    public Cake(int weight, String topping, String name) {
        super(weight);

        this.topping = topping;
        this.name = name;
    }

    public String getTopping() {
        return topping;
    }

    public void setTopping(String topping) {
        this.topping = topping;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Cake{" +
                "topping='" + topping + '\'' +
                ", name='" + name + '\'' +
                ", price=" + price +
                '}';
    }

    @Override
    public boolean equals(Object obj) {
        if(obj instanceof Cake) {
            Cake y = (Cake) obj;

            return this.name.equals(y.name) && this.topping.equals(y.topping) && this.price == y.price && this.getWeight() == y.getWeight();
        }

        return false;
    }

}
