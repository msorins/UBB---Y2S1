package repository;

import cexception.CException;
import model.Product;

public interface ProductManagement {
    public void insertProduct(Product p);
    public void removeProduct(Product p) throws CException;
    public Product[] getProducts();
    public void displayProduct(Product p);
}
