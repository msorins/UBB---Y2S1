public interface ProductRepository {
    public void addProduct(Product p);
    public void removeProduct(Product P);
    public Product[] getProducts();
}
