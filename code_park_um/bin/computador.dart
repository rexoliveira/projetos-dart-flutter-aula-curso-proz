class Computador {
  String narca = "";
  String tipo = "Desktop";
  double memoria = 4.00;
  String voltagem = "bivolt";
  int liga = 0;

  Computador({
    required this.narca,
    required this.tipo,
    required this.memoria,
    required this.voltagem,
    required this.liga,
  });

  

  void ligar() {
    liga = 1;
  }

  dynamic processar(dynamic entrada) {
    dynamic processo = entrada++;
    return processo;
  }

  double calcular(double calculo) {
    double resultado = calculo++;
    return resultado;
  }
}
