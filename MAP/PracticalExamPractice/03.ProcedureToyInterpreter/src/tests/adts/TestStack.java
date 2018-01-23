package tests.adts;

import exceptions.AdtExceptions;
import model.adts.MyStack;
import org.junit.jupiter.api.Test;

public class TestStack {

    public TestStack() {
        testTopPush();
    }

    @Test
    void testPop() {
        MyStack<Integer> st = new MyStack<Integer>();

        for(int i = 0; i <= 50; i++) {
            st.push(i);
            try {
                assert(st.top() == i);
            } catch (AdtExceptions adtExceptions) {
                adtExceptions.printStackTrace();
            }
        }

        for(int i = 50; i>=0; i--) {
            try {
                assert(st.pop() == i);
            } catch (AdtExceptions adtExceptions) {
                adtExceptions.printStackTrace();
            }
        }
    }

    @Test
    void testTopPush() {
        MyStack<Integer> st = new MyStack<Integer>();

        for(int i = 0; i <= 50; i++) {
            st.push(i);
            try {
                assert(st.top() == i);
            } catch (AdtExceptions adtExceptions) {
                adtExceptions.printStackTrace();
            }
        }
    }
}
