package model;

abstract public class Product {
    private double weight;

    public double getWeight() {
        return this.weight;
    }

    public Product(double weight) {
        this.weight = weight;
    }
}
