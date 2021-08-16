/**
   * 10. A partir dos valores da aceleração (a em m/s2), da velocidade inicial (v0 em m/s) e do tempo de percurso
   * (t em s).
*/


void main() {
  double v0 = 30;
  double a = 5;
  double t = 2;

  double velocidade = v0 + a * t;

  if(velocidade <= 40){
    print("Veículo muito lento");
  }else if(velocidade <= 60){
    print("Velocidade permitida");
  }else if(velocidade <= 80){
    print("Velocidade de cruzeiro");
  }else if(velocidade <= 120){
    print("Veículo rápido");
  }else {
    print("Veículo muito rápido");
  }
}