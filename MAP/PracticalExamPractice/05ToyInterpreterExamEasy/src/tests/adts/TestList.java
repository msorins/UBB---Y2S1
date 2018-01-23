package tests.adts;
import exceptions.AdtExceptions;
import model.adts.MyList;
import org.junit.jupiter.api.Test;

public class TestList {

    @Test
    void testPushBackSizeGetAt() throws AdtExceptions {
        MyList<Integer> lst = new MyList<Integer>();

        for(int i = 1; i <= 100; i++) {
            lst.push_back(i);

            assert(lst.size() == i);
            assert(lst.getAt(i-1) == i);
        }
    }

    @Test
    void testInsertAt() {
        MyList<Integer> lst = new MyList<Integer>();

        for(int i = 0; i <= 100; i++) {
            lst.push_back(i);
        }

        try {
            lst.insertAt(50, 101);
        } catch (AdtExceptions adtExceptions) {
            adtExceptions.printStackTrace();
        }
        try {
            assert(lst.getAt(50) == 101 && lst.getAt(51) == 50);
        } catch (AdtExceptions adtExceptions) {
            adtExceptions.printStackTrace();
        }
        assert(lst.size() == 102);

        try {
            lst.insertAt(0, 102);
        } catch (AdtExceptions adtExceptions) {
            adtExceptions.printStackTrace();
        }
        try {
            assert(lst.getAt(0) == 102 && lst.getAt(1) == 0);
        } catch (AdtExceptions adtExceptions) {
            adtExceptions.printStackTrace();
        }
        assert(lst.size() == 103);
    }


    @Test
    void remove() {
        MyList<Integer> lst = new MyList<Integer>();

        for(int i = 1; i <= 100; i++) {
            lst.push_back(i);
        }

       for(int i = 100; i>= 1; i--) {
            assert(lst.size() == i);

           try {
               lst.remove(i);
           } catch (AdtExceptions adtExceptions) {
               adtExceptions.printStackTrace();
           }

       }
    }

    @Test
    void removeAt() {
        MyList<Integer> lst = new MyList<Integer>();

        for(int i = 0; i <= 100; i++) {
            lst.push_back(i);
        }

        for(int i = 100; i>= 0; i-=2) {
            try {
                lst.removeAt(i);
            } catch (AdtExceptions adtExceptions) {
                adtExceptions.printStackTrace();
            }
        }

        assert(lst.size() == 50);

        for(int i = 0; i < lst.size(); i++) {
            try {
                assert(lst.getAt(i) % 2 == 1);
            } catch (AdtExceptions adtExceptions) {
                adtExceptions.printStackTrace();
            }
        }

    }

}
