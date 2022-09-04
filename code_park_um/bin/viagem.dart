class Viagem {
  double distancia = 0.00;
  String duracao = "00:00:00";
  double valor = 0.00;
  String destino = "Brasil";
  String routeiro = "";

  Viagem({
    required this.distancia,
    required this.duracao,
    required this.valor,
    required this.destino,
    required this.routeiro,
  });

  double calcularDistancia(double pontoInicial, double pontoFinal) {
    distancia = pontoFinal - pontoInicial;
    return distancia;
  }

  String calcularDuracao(double distancia) {
    //Média 95km/h
    duracao = (distancia / 95).toString();
    return duracao;
  }

  double calcularValor(double distancia, double despesas) {
    valor = distancia + despesas;
    return valor;
  }

  String definirDestino(String parada) {
    routeiro = parada;
    destino = routeiro;
    return destino;
  }

}
