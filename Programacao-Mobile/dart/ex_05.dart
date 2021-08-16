/**
 * 5.Entrar via teclado com o valor de cinco produtos. Após as entradas, digitar um valor referente ao
 * pagamento da somatória destes valores. Calcular e exibir o troco que deverá ser devolvido.
*/
void main() {
  double prod1 = 10;
  double prod2 = 2.60;
  double prod3 = 3.20;
  double prod4 = 4.70;
  double prod5 = 0.50;
  
  double total = prod1 + prod2 + prod3 + prod4 + prod5;
  
  double valorPago = 40;
  
  double troco =  valorPago - total;
 
  
  print(troco);
}