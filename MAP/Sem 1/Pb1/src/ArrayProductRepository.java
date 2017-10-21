public class ArrayProductRepository implements ProductRepository {
    private Product prod[];
    private int nrprod;

    public ArrayProductRepository() {
        prod = new Product[100];
        nrprod = 0;
    }
    @Override
    public void addProduct(Product p) {
        if(nrprod == prod.length)
            resize();

        this.prod[nrprod++] = p;
    }

    @Override
    public void removeProduct(Product p) {
        for(int i = 0; i < nrprod; i++ )
            if( prod[i].equals(p) ) {
                prod[i] = this.prod[nrprod];
                nrprod--;
            }
    }

    @Override
    public Product[] getProducts() {
        Product[] nprod = new Product[nrprod];
        for(int i = 0; i < nrprod ; i++)
            nprod[i] = prod[i];

        return nprod;
    }

    private void resize() {
        Product []nprod = new Product[nrprod * 2];

        for(int i = 0; i < nrprod; i++)
            nprod[i] = prod[i];

        prod = nprod;
    }
}
