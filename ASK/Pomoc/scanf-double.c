#include <stdio.h>

int main() {
    printf("scanf-double.c\n\n");
    
    double a;
    
    start: printf("a = ");
    
    scanf("%lf", &a);
    
    if (getchar() != '\n') {
        
        while (getchar() != '\n');

        goto start;
    }
    
    printf("a = %f\n", a);

    return 0;
}

