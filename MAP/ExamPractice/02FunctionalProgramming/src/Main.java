import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Main {

    public static void dd(Object x) {
        
    }
    public static void main(String args[]) {
        List<String> lstString = Arrays.asList("ana", "are", "mere", "eu", "am", "ciordit", "din", "ele", "yo");

        //List<Integer> lstInteger = Arrays.asList(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ,13, 14, 15, 16);
        List<Integer> lstInteger = Arrays.asList(16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1);

        System.out.println( lstInteger.stream()
                .filter( x -> x % 2 == 1)
                .sorted()
        );
    }
}

//  intermediate ops
//  -   filter( x -> x % 2)
//  -   sorted()
//  -   distinct()
//  -   map( x -> x * 2)
//  -   limit( 2 )
//  -   skip( 2 )


// final ops
//  -   ! reduce( 0, (accumulator, crt) -> accumulator + crt ));
//  -   ! collector (Collectors::toList()).get
//  -   anyMatch( x -> x == 17)
//  -   allMatch( x -> x % 2 == 0 || x % 2 == 1)
//  -   noneMatch( )
//  -   count()
//  -   .findAny().get()
//  -   .findFirst().get()
//  -   forEach(x -> System.out.println(x))
