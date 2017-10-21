package view;

import cexception.CException;
import controller.Controller;
import model.Eggplant;
import model.Pepper;
import model.Product;
import model.Tomato;

public class View {
    Controller controller;

    public View() {
        this.controller = new Controller();
    }

    public void insertProduct(Product p) throws CException {
        if(p instanceof Eggplant || p instanceof Pepper || p instanceof Tomato)
            this.controller.insertProduct(p);
        else
            throw new CException("Invalid product");
    }

    public void removeProduct(Product p) throws CException{
        this.controller.removeProduct(p);
    }

    public void displayProduct(Product p) {
        this.controller.displayProduct(p);
    }

    public void displayProducts() {
        for(int i = 0; i < this.controller.getProducts().length; i++)
            displayProduct(this.controller.getProducts()[i]);
    }

    public void displayProductsFilteresByWeights(double weight) {
        for(int i = 0; i < this.controller.getProducts().length; i++)
            if(this.controller.getProducts()[i].getWeight() >= weight)
                displayProduct(this.controller.getProducts()[i]);
    }
}
