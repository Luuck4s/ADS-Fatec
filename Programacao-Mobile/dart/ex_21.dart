/**
   * 21.  Criar um mini sistema bancário com as classes: Conta, Conta Corrente, Conta Poupança e Cliente. Cada classe deve ter atributos específicos. No sistema devemos ter pelo menos 3 funcionalidades: Saque, Depósito e Transferência.

*/

void main() {
  ContaCorrente conta1 = new ContaCorrente(1, 123, 0, 100);
  Cliente cliente1 = new Cliente(conta1, "Lucas");
  
  ContaPoupanca conta2 = new ContaPoupanca(2, 456, 0, 2);
  Cliente cliente2 = new Cliente(conta2, "Pedro");
  
  conta1.Deposito(500);
  conta1.Saque(100);
  conta1.Saque(400);
  
  conta1.Transferencia(50, conta2);
  
  print(cliente1);
  print(cliente2);
  
}

class Conta{
  int id;
  int number;
  double amount;
  String history = "\n\t Histórico \n";
  
  Conta(this.id, this.number, this.amount);
  
  Deposito(double amount){
    if(amount > 0){
      this.amount += amount;  
      this.SaveToHistory("** Depósito $amount **");
    }
  }
  
  Saque(double amount){
    if(amount <= this.amount){
      this.amount -= amount;
      this.SaveToHistory("** Saque $amount **");
      return true;
    }else {
      return false;
    }
  }
  
  Transferencia(double amount, Conta destino){
    if(this.Saque(amount)){
      destino.Deposito(amount);
      this.SaveToHistory("** Transferência $amount **");
    }
  }
  
  SaveToHistory(String event){
    this.history += "\t\t$event\n";
  }
  
  @override  
  String toString() {
    return "\tId: $id\n\tNumber: $number\n\tAmount: $amount\n\t\t$history";
  }
}

class ContaCorrente extends Conta {
  double chequeEspecial;
  
  ContaCorrente(id, number, amount,this.chequeEspecial):super(id, number, amount);
  
  @override
  String toString() {
    return "\tId: $id\n\tNumber: $number\n\tAmount: $amount\n\tCheque Especial: $chequeEspecial\n$history";
  }
  
  @override  
  Saque(double amount){
    double amountWithCheque = this.amount + this.chequeEspecial;
    
    if(amount <= this.amount){
      this.amount -= amount;
      this.SaveToHistory("** Saque $amount **");
      return true;
    }else if(amount <= amountWithCheque) {
      double usedOfCheque = amount - this.amount;
      this.amount -= amount;
      this.chequeEspecial = this.chequeEspecial - usedOfCheque;
      
      this.SaveToHistory("** Saque [Limite Especial] $amount **");
      return true;
    }else {
      return false;
    }
  }
}

class ContaPoupanca extends Conta {
  int taxaRendimento;
  
  ContaPoupanca(id, number, amount, this.taxaRendimento):super(id, number, amount);
  
  @override  
  String toString() {
    return "\tId: $id\n\tNumber: $number\n\tAmount: $amount\n\tTaxa Rendimento: $taxaRendimento\n$history";
  }
}

class Cliente{
  String nome;
  Conta conta;
  
  Cliente(this.conta, this.nome);
  
  String toString() {
    return "Nome: $nome\n$conta\n";
  }
}
