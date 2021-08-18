/**
   * 18. Armazenar vinte valores em um vetor. Após a digitação, entrar com uma constante multiplicativa que deverá multiplicar cada um dos valores do vetor e armazenar o resultado no próprio vetor, na respectiva posição.
*/


void main() {
  final numbers = [];
  int mult = 4;
  
  for(int i = 0; i < 20; i++){
    numbers.add(i);
  }
  

  numbers.asMap().forEach((index, element){
    numbers[index] = element * mult;
  });
  
  
  for(int number in numbers){
   print(number);
  }
  

}