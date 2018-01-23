import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.function.Supplier;
import java.util.stream.Collector;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class MainPBS {

    public static void main(String []arg) {
        List<String> words = Arrays.asList("i", "be", "are", "merhe", "hu", "aq", "ciordit", "din", "ele");

//        P1. Loop down the words and print each on a separate line, with two spaces in front of each word.
//        Don’t use map

        /*words.stream()
                .forEach(x -> System.out.println("  " + x));*/

//        P2. Repeat the previous problem, but without the two spaces in front. This is trivial if you use the
//        same approach as in #1, so the point is to use a method reference here, as opposed to an explicit
//        lambda in problem 1.
//

       /* words.stream()
                .forEach( Pb2Prt::prtWord );*/

//        P3. We assume that we have a method StringUtils.transformedList(List<String>,
//                Function1<String>)
//        where interface Function1<T> { T app(T);}
//        and we produced transformed lists like this:
//          • List<String> excitingWords = StringUtils.transformedList(words, s -> s + "!");
//          • List<String> eyeWords = StringUtils.transformedList(words, s -> s.replace("i", "eye"));
//          • List<String> upperCaseWords = StringUtils.transformedList(words, String::toUpperCase);
//        Produce the same lists as above, but this time use streams and the builtin “map” method

        /*words.stream()
                .map( s -> s + "!")
                .map( s -> { if(s.equals("i!")) return "eye"; return s;} )
                .map( s -> s.toUpperCase() )
                .forEach( s-> System.out.println(s) );*/


//        P4. We assume that we have the method StringUtils.allMatches(List<String>, Predicate1<String>)
//        where interface Predicate1<T> { boolean check(T);}
//        and we produced filtered lists like this:
//            • List<String> shortWords = StringUtils.allMatches(words, s -> s.length() < 4);
//            • List<String> wordsWithB = StringUtils.allMatches(words, s -> s.contains("b"));
//            • List<String> evenLengthWords = StringUtils.allMatches(words, s -> (s.length() % 2) == 0);
//        Produce the same lists as above, but this time use “filter”.

        /*words.stream()
                .filter( x -> x.length() < 4 )
                .filter( x -> x.contains("b") )
                .filter( x -> x.length() % 2 == 0)
                .forEach( x -> System.out.println(x) );*/

//        P5. Turn the strings into uppercase, keep only the ones that are shorter than 4 characters, of what is
//        remaining, keep only the ones that contain “E”, and print the first result. Repeat the process, except
//        checking for a “Q” instead of an “E”. When checking for the “Q”, try to avoid repeating all the code
//        from when you checked for an “E”.


        /*Supplier<Stream<String>> strm = () -> words.stream()
                .filter(x -> x.length() < 4);

        System.out.println(
                strm
                        .get()
                        .filter(x -> x.contains("e"))
                        .collect(Collectors.toMap(
                                x -> x,
                                x -> x + ";;"
                        ))
        );

        System.out.println(
                strm
                        .get()
                        .filter(x -> x.contains("q"))
                        .collect(Collectors.toList())

        );*/

//    P6. Produce a single String that is the result of concatenating the uppercase versions of all of the
//    Strings. Use a single reduce operation, without using map

       /* System.out.println( words.stream()
                .reduce("", (acc, elem) -> acc + elem.toUpperCase() + " ")
        );*/

//        P7. Produce the same String as above, but this time via a map operation that turns the words into
//        uppercase, followed by a reduce operation that concatenates them

       /* System.out.println(
                words.stream()
                .map(x -> x.toUpperCase())
                .reduce("", (acc, elem) -> acc + elem + " ")
        );*/

//        P8. Produce a String that is all the words concatenated together, but with commas in between. E.g.,
//                the result should be "hi,hello,...". Note that there is no comma at the beginning, before “hi”, and
//        also no comma at the end, after the last word. Major hint: there are two versions of reduce discussed
//        in the notes.

       /* System.out.println(
                words.stream()
                .reduce("", (acc, elem) -> acc + elem + ",")
        );*/

//        P9. Find the total number of characters (i.e., sum of the lengths) of the strings in the List
        /*System.out.println(
                words.stream()
                .mapToInt(x -> x.length())
                .sum()
        );

        System.out.println(
                words.stream()
                        .mapToInt(x -> x.length())
                        .reduce(0, (acc, elem) -> acc + elem)
        );*/

//       P10. Find the number of words that contain an “h”.
       /* System.out.println(
                words.stream()
                        .filter(x -> x.contains("h"))
                        .count()
        );
*/
//       PExamen
//        //sir de numere, mapez fiecar element la predecesorul, trebuie sa pastrezi numerele multiplu de 3 sau de 8, sa le fac suma, colectez dintr-o lista

        ArrayList<Integer> lst = new ArrayList<Integer>( Arrays.asList(2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 ,16 ,17, 18, 19, 20) );

        System.out.println(
                new ArrayList<Integer>( Arrays.asList(

                        lst.stream()
                                .map( x -> x - 1)
                                .filter( x -> x % 3 == 0 || x % 3 == 8)
                                .reduce((acc, elem) -> acc + elem)
                                .get()



                ))


        );

    }

}
