class Endereco {
  String? logradouro;
  int? numero;
  String? bairro;
  String? estadoSigla;
  int? cep;
  String complemento;
  Endereco([
    this.complemento = "",
  ]);

  getLogradouro() => logradouro;

  setLogradouro(logradouro) => this.logradouro = logradouro;

  getNumero() => numero;

  setNumero(numero) => this.numero = numero;

  getBairro() => bairro;

  setBairro(bairro) => this.bairro = bairro;

  getEstadoSigla() => estadoSigla;

  setEstadoSigla(estadoSigla) => this.estadoSigla = estadoSigla;

  getCep() => cep;

  setCep(cep) => this.cep = cep;

  
  @override
  String toString() {
    return '$logradouro, $numero, $bairro, $estadoSigla, $cep, $complemento';
  }
}
