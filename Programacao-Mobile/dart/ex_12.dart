/**
   * 12. Entrar via teclado com um valor (X) qualquer. Digitar o intervalo que o programa que deverá calcular a tabuada do valor X digitado, sendo que o segundo valor (B), deverá ser maior que o primeiro (A). Exibir a tabuada do valor digitado, no intervalo decrescente, ou seja, a tabuada de X no intervalo de B para A.
*/


void main() {
  int valor = 98;
  int a = 8;
  int b = 12;

  if(a > b){
    print("Error, o valor de B precisa ser maior que A");
  }else {
    for(int i = a; i <= b; i++){
    int result = valor * i;
    print("$i * $valor = $result");
    }
  }
}