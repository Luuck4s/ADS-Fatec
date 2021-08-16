/**
  * 7. Entrar com o peso e a altura de uma determinada pessoa. Após a digitação,
  * exibir se esta pessoa está ou não com seu peso ideal. Fórmula: peso/altura².
*/
void main() {
  double height = 1.50;
  double weight = 80;
  
  double weightIdeal = weight / (height * height);
  

  if(weight <= weightIdeal){
    print("Peso ideal");
  }else {
    print("Peso não ideal");
  }
  
  
}