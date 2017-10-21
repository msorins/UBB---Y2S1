public class Book extends Product{
    private String title, author;

    public Book(int weight, String title, String author) {
        super(weight);

        this.title = title;
        this.author = author;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    @Override
    public String toString() {
        return title + " " + author + " " + this.getWeight();
     }

    @Override
    public boolean equals(Object obj) {
        if(obj instanceof Book) {
            Book y = (Book) obj;

            return title.equals(y.title) && author.equals(y.author);
        }

        return false;
    }
}
