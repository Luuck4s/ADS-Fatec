/**
   * 9. Entrar com o peso, o sexo e a altura de uma determinada pessoa. Após a digitação, exibir se esta pessoa
   * está ou não com seu peso ideal. Fórmula: peso/altura².
*/

void main() {
  double weight = 60;
  double height = 1.70;
  String sexo = "M";
    
  double weightIdeal = weight / (height * height);
  
  
  if(sexo == "M"){
    
    if(weightIdeal < 20){
      print("Abaixo do peso");
    }else if(weightIdeal >= 20 && weightIdeal < 25){
      print("Peso ideal");
    }else{
      print("Acima do peso");
    }  
  }else {
  
    if(weightIdeal < 19){
      print("Abaixo do peso");
    }else if(weightIdeal >= 19 && weightIdeal < 24){
      print("Peso ideal");
    }else{
      print("Acima do peso");
    }
  }
  
}