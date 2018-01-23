import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args)
    {
       List<A> listA = new ArrayList<A>();
       List<B> listB = new ArrayList<B>();

       // Try to set listA point to listB
        listA.add(new A());
        listA.add(new B());
        listA.add(new C());


        //Call testParamA
        A a = new A();
        B b = new B();
        C c = new C();

        // ##### Testing Param #####
        testParamA(a);
        testParamA(b);
        testParamA(c);

        // testParamB(a); Error -> a not subclass of b
        testParamB(b);
        testParamB(c);

        // testParamC(a); Error -> a not subclass of C
        // testParamC(b); Error -> b not subclass of
        testParamC(c);

        // ##### Testing Return #####
        A res1 = testReturnA(a);
        //B res2 = testReturnA(a);
        //C res3 = testReturnA(a);

        A res4 = testReturnB(b);
        B res5 = testReturnB(b);
        //C res6 = testReturnB(b);

        A res7 = testReturnC(c);
        B res8 = testReturnC(c);
        C res9 = testReturnC(c);

        // ########

        Main.insertElements();

    }

    public static void testParamA(A a) {
        System.out.println("testParamA works");
    }

    public static void testParamB(B b) {
        System.out.println("testParamB works");
    }

    public static void testParamC(C c) {
        System.out.println("testParamC works");
    }

    public static A testReturnA(A a) {
        System.out.println("testReturnA works");

        return null;
    }

    public static B testReturnB(B b) {
        System.out.println("testReturnB works");

        return null;
    }

    public static C testReturnC(C c) {
        System.out.println("testReturnC works");

        return null;
    }

    // OBIECT -> A -> B -> C
    public static void insertElements(List<? super  A> list) {
        list.add(new A());
        list.add(new B());
        list.add(new C());
    }

    public void processElements(List<? extends A> elements){
        for(A a : elements){
            System.out.println(a.toString());
        }
    }
}
