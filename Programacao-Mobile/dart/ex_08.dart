/**
  * 8. A partir de três valores que serão digitados, verificar se formam ou não um triângulo. Em caso positivo, exibir sua classificação: “Isósceles, escaleno ou 
  * eqüilátero”. Um triângulo escaleno possui todos os lados diferentes, o isósceles, dois lados iguais e o eqüilátero, todos os lados iguais. Para existir triângulo é
  * necessário que a soma de dois lados quaisquer seja maior que o outro, isto, para os três lados
*/

import 'dart:math';

void main() {
  int a = 5;
  int b = 8;
  int c = 4;
  

  if(a >= (b + c)){
       print("NAO FORMA TRIANGULO\n");
   }else {
        
       if(pow(a,2) == (pow(b,2) + pow(c,2))){
           print("TRIANGULO RETANGULO\n");
       } 
       
       if(pow(a,2) > (pow(b,2) + pow(c,2))){
           print("TRIANGULO OBTUSANGULO\n");
       }
       
       if(pow(a,2) < (pow(b,2) + pow(c,2))){
           print("TRIANGULO ACUTANGULO\n");
       }
       
       if(a == b && a == c && b == c){
           print("TRIANGULO EQUILATERO\n");
       }else if(a == b || a == c || b == c){
           print("TRIANGULO ISOSCELES\n");
       } 
   }  
}