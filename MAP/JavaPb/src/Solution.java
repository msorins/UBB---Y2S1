import java.util.Random;

public class Solution {

    public void insertFirstInStack(MyStack player, MyStack tableCards) {
        MyStack aux = new MyStack(100);

        while(!player.isEmpty()) {
            aux.push(player.peek());
            player.pop();
        }

        while(!tableCards.isEmpty()) {
            player.push(tableCards.peek());
            tableCards.pop();
        }

        while(!aux.isEmpty()) {
            player.push(aux.peek());
            aux.pop();
        }
    }

    public void solve() throws Exception {
        MyStack p1 = new MyStack(11);
        MyStack p2 = new MyStack(11);
        char[] x = {'R', 'N'};

        //Harcodate - ar trebui citit de la tastatura
        int n = 10;

        if(n % 2 != 0) {
            throw new Exception("N must be even");
        }

        //Generez random pachetele
        Random rn = new Random();
        for(int i = 1; i <= n / 2; i++) {
            p1.push( x[rn.nextInt(2) % 2]);
            p2.push( x[rn.nextInt(2) % 2]);
        }

        //Nr curent de carti rosii si negre de pe masa
        MyStack tableCards = new MyStack(10);

        //Play the game
        while(!p1.isEmpty() && !p2.isEmpty()) {

            //Cat timp niciunul dintre jucatori nu ia cartile inapoi in pachet
            while(p1.peek() == p2.peek()) {
                if(p1.peek() == 'R') {
                    tableCards.push('R');
                    tableCards.push('R');
                }
                else {
                    tableCards.push('N');
                    tableCards.push('N');
                }

                p1.pop();
                p2.pop();
            }

            //Cineva a dat un R, altcineva a dat un N
            tableCards.push('N');
            tableCards.push('R');

            if(p1.peek() == 'R') {
                p1.pop();
                p2.pop();
                insertFirstInStack(p2, tableCards);
            }else if(p2.peek() == 'R') {
                p1.pop();
                p2.pop();
                insertFirstInStack(p1, tableCards);
            }
        }
    }

}
