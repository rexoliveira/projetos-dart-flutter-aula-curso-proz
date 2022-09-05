class Livro {
  //Propriedades do Livro
  String nome;
  int quantidadePaginas;
  String autor;
  int ano;
  bool? penalidadeAtraso;
  num _multa = 0;

  //Coonstrutor da Classe
  Livro({
    required this.nome,
    required this.quantidadePaginas,
    required this.autor,
    required this.ano,
    this.penalidadeAtraso = false,
  });

  //Defino se está está em atraso ou não
  //Por padrão, não
  void penalizarAtraso(bool atraso) {
    penalidadeAtraso = atraso;
  }

  //Possibilidade de controle de valor mínimo ou máximo
  //Sendo um metodo privado, só pode ser definido indiretamente
  void setMultaAtraso(num valor) {
    _multa = valor;
  }
  //Metodo privado
  //Se foi definido um valor mas não marcado como atrasado retorna 0
  num? getMultaAtraso() {
    if (penalidadeAtraso!) {
      return _multa;
    }
    return 0;
  }

  //Imprime o resultado de casa instância realizada
  @override
  String toString() {
    return 'Livro:\n Nome: $nome,\n Quantidade de Páginas: $quantidadePaginas,\n Autor: $autor,\n Ano: $ano,\n Penalidade por Atraso: $penalidadeAtraso,\n Multa: ${getMultaAtraso().toString()}';
  }
}
