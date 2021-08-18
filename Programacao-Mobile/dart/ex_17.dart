/**
   * 17.   Armazenar dez valores na memória do computador. Após a digitação dos valores, criar uma rotina para ler os valores e achar e exibir o maior deles.
*/


void main() {
  final numbers = [];
  int bigger = 0;
  
  for(int i = 0; i < 10; i++){
    numbers.add(i);
  }

  for(int number in numbers){
    if(number > bigger){
      bigger = number;
    }
  }

  print(bigger);

}