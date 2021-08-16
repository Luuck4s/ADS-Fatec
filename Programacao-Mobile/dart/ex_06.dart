/**
  * 6. Calcular e exibir a área de um retângulo, a partir dos valores da base e altura que 
  * serão digitados. Se a área for maior que 100, exibir a mensagem “Terreno grande”, 
  * caso contrário, exibir a mensagem “Terreno pequeno”.
*/
void main() {
  int base = 10;
  int height = 15;
  
  int area = base * height;
  
  if(area > 100){
    print("Terreno grande");
  }else {
    print("Terreno pequeno");
  }
}