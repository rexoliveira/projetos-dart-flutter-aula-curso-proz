class Endereco {
  String? logradouro;
  int? numero;
  String? bairro;
  String? estadoSigla;
  String? cep;
  String? complemento;
  

  getLogradouro() => logradouro;

  setLogradouro(logradouro) => this.logradouro = logradouro;

  int? getNumero() => numero;

  setNumero(int numero) => this.numero = numero;

  getBairro() => bairro;

  setBairro(bairro) => this.bairro = bairro;

  getEstadoSigla() => estadoSigla;

  setEstadoSigla(estadoSigla) => this.estadoSigla = estadoSigla;

  getCep() => cep;

  setCep(cep) => this.cep = cep;

  getComplemento() => complemento;

  setComplemento(complemento) => this.complemento = complemento;

  
  @override
  String toString() {
    return '$logradouro, $numero, $bairro, $estadoSigla, $cep, $complemento';
  }
}
