import java.util.Arrays;
import java.util.List;

public class MainSort {
    public static void main(String []arg) {
        List<String> words = Arrays.asList("i", "be", "are", "mere", "eu", "aq", "ciordit", "din", "ele");
        words.sort((a, b) -> a.compareTo(b));
    }
}
