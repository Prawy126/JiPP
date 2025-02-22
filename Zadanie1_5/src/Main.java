import java.util.Random;

public class Main {
    public static void main(String[] args) {
        int tablica[] = new int[10];
        Random random = new Random();
        for(int i = 0; i < tablica.length; i++){
            tablica[i] = random.nextInt(5)+1;
        }

        for(int i = 0; i < tablica.length; i++){
            System.out.print(tablica[i]+" ");
        }
    }
}