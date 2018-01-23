public class Main {

    public static void interchange(Punct X, Punct Y) {
        Punct Aux = X;
        X = Y;
        Y = Aux;
    }

    public static void main(String[] args) {
        String s = "abc";
        s = s + "123";
        String t = s;
        t += 12;

        Punct a = new Punct(1, 2);
        Punct b = new Punct(3, 4);
        Main.interchange(a, b);

        X c = new X();

        if(c instanceof Punct)
            System.out.println("da");
        else
            System.out.println("nu");

        int aaa = 333;
    }
}
