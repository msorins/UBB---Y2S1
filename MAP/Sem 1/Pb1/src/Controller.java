public class Controller {
    private ProductRepository repo;

    public Controller(ProductRepository r) {
        repo = r;
    }

    public void addProduct(Product p) {
        repo.addProduct(p);
    }

    public void removeProduct(Product p) {
        repo.removeProduct(p);
    }

    public void display(int height) {

    }
}
