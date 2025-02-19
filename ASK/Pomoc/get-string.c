#include <stdio.h>

#define N 100 // maksymalny rozmiar lancucha znakow

int main() {
    printf("get-string.c\n\n");
    
    char str[N+1];
    
    printf("str = ");
    
    int i = 0;
    
    char znak;
    
    while (i < N && (znak = getchar()) != '\n') str[i++] = znak;
    
    str[i] = '\0';
    
    printf("str = %s\n", str);

    return 0;
}

