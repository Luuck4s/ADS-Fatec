/**
   * 15. Calcular e exibir a soma dos “N” primeiros valores da seqüência abaixo. O valor “N” será digitado, deverá ser positivo, mas menor que cem. Caso o valor não satisfaça a restrição, enviar mensagem de erro e solicitar o valor novamente.

*/


void main() {
  int actual = 2;
  int count = 1;
  int nextImpar = 0;
  int lastImpar = 0;
  int limit = 20;
  int total = 0;

  if(limit > 100){
    print("ERRO, informe um limite abaixo de 100");
  }else {

    while(count <= limit){

     print("$countº = $actual");
   
    for(int i = count; i <= limit; i++){
      if(i % 2 != 0 && i > lastImpar && i != 1){
        nextImpar = i;
        lastImpar = i;
        break;
      }
    }
    

    actual = actual + nextImpar;
    total += actual;
    count++;
  }
  }

  print("\n Total calculado: $total");
}