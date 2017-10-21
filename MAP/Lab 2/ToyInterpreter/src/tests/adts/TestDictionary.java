package tests.adts;
import exceptions.AdtExceptions;
import model.adts.MyDictionary;
import org.junit.jupiter.api.Test;
import org.omg.CORBA.INTERNAL;

public class TestDictionary {

    @Test
    void testInsertFindSize() {
        MyDictionary<String, Integer> dict = new MyDictionary<String, Integer>();

        dict.insert("abc", 1);
        assert(dict.size() == 1 && dict.find("abc"));

        dict.insert("bcdef", 2);
        assert(dict.size() == 2 && dict.find("bcdef"));

        assert(!dict.find("sasa") && !dict.find("asdiojasd") && !dict.find("abcd"));
    }

    @Test
    void testEraseEmptyFindSize() throws AdtExceptions {
        MyDictionary<String, Integer> dict = new MyDictionary<String, Integer>();
        dict.insert("a", 1);
        dict.insert("b", 2);
        dict.insert("c", 3);
        dict.insert("d", 4);

        assert(dict.size() == 4);
        assert(dict.find("a") && dict.find("b") && dict.find("c") && dict.find("d") && dict.find("d"));

        dict.erase("a");
        assert(!dict.find("a") && dict.find("b") && dict.find("c") && dict.find("d") && !dict.empty());
        dict.erase("b");
        assert(!dict.find("a") && !dict.find("b") && dict.find("c") && dict.find("d") && !dict.empty());
        dict.erase("c");
        assert(!dict.find("a") && !dict.find("b") && !dict.find("c") && dict.find("d") && !dict.empty());
        dict.erase("d");
        assert(!dict.find("a") && !dict.find("b") && !dict.find("c") && !dict.find("d") && dict.empty());
    }
}
