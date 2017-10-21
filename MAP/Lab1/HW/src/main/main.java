package main;

import cexception.CException;
import model.Eggplant;
import model.Pepper;
import model.Tomato;
import view.View;

public class main {


        View view = new View();

        view.insertProduct(new Eggplant(0.1, "Spania"));
        view.insertProduct(new Eggplant(0.2, "Grecia"));
        view.insertProduct(new Eggplant(0.3, "Romania"));


        view.insertProduct(new Pepper(0.2, "Franta"));
        view.insertProduct(new Pepper(0.2, "Spania"));
        view.insertProduct(new Pepper(0.4, "Grecia"));

        view.insertProduct(new Tomato(0.6, "Norvegia"));
        view.insertProduct(new Tomato(0.1, "Africa"));
        view.insertProduct(new Tomato(0.15, "China"));

        //view.displayProducts();
        //view.displayProductsFilteresByWeights(0.2);


        view.removeProduct(new Eggplant(0.1, "Spania"));
        view.removeProduct(new Eggplant(0.3, "Romania"));
        view.removeProduct(new Eggplant(0.3, "Romania"));


        view.displayProducts();
        System.out.println("\n\n\n");
        view.displayProductsFilteresByWeights(0.2);
    }
}
