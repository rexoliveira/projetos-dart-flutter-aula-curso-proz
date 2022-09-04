class AparelhoSom {
  int volume = 0;
  double potencia = 1920.00;
  String marca = "sem marca";
  bool radioAm = false;
  bool reproduz = false;

  AparelhoSom({
    this.volume = 50,
    required this.potencia,
    required this.marca,
    required this.radioAm,
  });

  void reproduzir() {
    reproduz = true;
  }

  void controlarVolume(int passos) {
    volume = passos++;
  }

  String sintonizarFm(int esquerda, int direita) {
    esquerda++;
    direita++;
    String estacao = (esquerda - direita).toString();
    return estacao;
  }

  void selecionar(dynamic entrada) {
    entrada++;
  }
}
