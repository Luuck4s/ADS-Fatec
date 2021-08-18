/**
   * 13  Exibir os trinta primeiros valores da série de Fibonacci. A série:
*/


void main() {
  int actual = 0;
  int previus = 1;
  int aux;
  int count = 1;

  while(count <= 30){
    aux = actual;
    actual = actual + previus;
    previus = aux;

    print("$countº = $actual");

    count++;
  }
}