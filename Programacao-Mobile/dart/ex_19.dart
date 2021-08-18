/**
   * 19.  Armazenar o nome e idade de cem pessoas. Após a digitação, 
   exibir os dados (nome e idade) de todas as pessoas.
*/
import 'dart:math';

void main() {
  final names = [];
  final ages = [];
  var random = new Random();
  int limit = 100;

  for(int i = 0; i < limit; i++){
    int randomNumber = random.nextInt(100);
    String randomName = "nome-$i";

    names.add(randomName);
    ages.add(randomNumber);
  }
  
  
  for(int j = 0; j < limit; j++){
    String name = names[j];
    int age = ages[j];
    
    print("$jº = ${name} ${age}");
  }
  
}
