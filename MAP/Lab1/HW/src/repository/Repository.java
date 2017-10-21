package repository;

import cexception.CException;
import model.Product;

public class Repository implements ProductManagement{
    private Product[] products;
    private int nrOfProducts;

    public Repository() {
        products = new Product[10];
        nrOfProducts = 0;
    }

    public void insertProduct(Product p) {
        if(nrOfProducts == products.length) {
            resize();
        }

        products[nrOfProducts] = p;
        nrOfProducts += 1;
    }

    public void removeProduct(Product p) throws CException {
        for(int i = 0; i < nrOfProducts; i++) {
            if(products[i].equals(p)) {
                products[i] = products[nrOfProducts - 1];
                nrOfProducts--;
                return ;
            }
        }

        throw new CException("No product found");
    }

    public Product[] getProducts() {
        Product[] nproducts = new Product[nrOfProducts];
        for(int i = 0; i < nrOfProducts; i++) {
            nproducts[i] = products[i];
        }

        return nproducts;
    }

    @Override
    public void displayProduct(Product p) {
        System.out.print(p + "\n");
    }

    private void resize() {
        Product[] nproducts = new Product[nrOfProducts * 2];
        for(int i = 0; i < nrOfProducts; i++) {
            nproducts[i] = products[i];
        }

        products = nproducts;
    }
}
