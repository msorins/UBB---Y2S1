package controller;

import cexception.CException;
import model.Eggplant;
import model.Product;
import repository.ProductManagement;
import repository.Repository;

public class Controller implements ProductManagement {
    private ProductManagement repo;

    public Controller() {
        repo = new Repository();
    }

    @Override
    public void insertProduct(Product p) {
        repo.insertProduct(p);
    }

    @Override
    public void removeProduct(Product p) throws CException {
        try {
            repo.removeProduct(p);
        } catch (CException e) {
            System.out.println("Exception thrown: " + e.getMsg());
        }
    }

    @Override
    public Product[] getProducts() {
        return repo.getProducts();
    }

    @Override
    public void displayProduct(Product p) {
        repo.displayProduct(p);
    }
}
