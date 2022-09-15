// ignore_for_file: public_member_api_docs, sort_constructors_first
class Endereco {
  String? logradouro;
  int? numero;
  String? bairro;
  String? estadoSigla;
  int? cep;
  String complemento;
  Endereco({
    this.logradouro,
    this.numero,
    this.bairro,
    this.estadoSigla,
    this.cep,
    this.complemento = "",
  });

  get getLogradouro => logradouro;

  setLogradouro(logradouro) => this.logradouro = logradouro;

  get getNumero => numero;

  setNumero(numero) => this.numero = numero;

  get getBairro => bairro;

  setBairro(bairro) => this.bairro = bairro;

  get getEstadoSigla => estadoSigla;

  setEstadoSigla(estadoSigla) => this.estadoSigla = estadoSigla;

  get getCep => cep;

  setCep(cep) => this.cep = cep;

  get getComplemento => complemento;

  setComplemento(complemento) => this.complemento = complemento;


  @override
  String toString() {
    return 'Endereco(logradouro: $logradouro, numero: $numero, bairro: $bairro, estadoSigla: $estadoSigla, cep: $cep, complemento: $complemento)';
  }
}
