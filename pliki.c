#include <stdio.h>

int main() 
{
  int a, b, c;
  FILE *in, *out;
  in = fopen("liczby.txt", "r");
  out = fopen("wynik.txt", "w");
  
  fscanf(in, "%d%d", &a, &b);
  c = a + b;
  fprintf(out, "%d", c);
  
  fclose(in);
  fclose(out);
  return 0;
}
