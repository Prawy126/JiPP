import java.io.*;
import java.util.Scanner;

public class Main2 {
    public static void main(String[] args) {
        int a, b, c;

        try {
            File inFile = new File("liczby.txt");
            Scanner scanner = new Scanner(inFile);

            a = scanner.nextInt();
            b = scanner.nextInt();
            scanner.close();

            c = a + b;

            FileWriter outFile = new FileWriter("wynik.txt");
            outFile.write(Integer.toString(c));
            outFile.close();

            System.out.println("Wynik zapisany do pliku wynik.txt");

        } catch (IOException e) {
            System.out.println("Błąd podczas operacji na plikach!");
            e.printStackTrace();
        }
    }
}
