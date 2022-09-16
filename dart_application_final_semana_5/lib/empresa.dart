import 'package:dart_application_final_semana_5/endereco.dart';
import 'package:dart_application_final_semana_5/socio.dart';

class Empresa {
  String? id;
  String? _razaoSocial;
  String? _nomeFantasia;
  int? _cnpj;
  Endereco? _endereco;

  String? telefone;
  String? horarioCadastro;
  Socio? socio;

  String? get getId => id;

  setId(String? id) => this.id = id;

  String? getRazaoSocial() => _razaoSocial;

  setRazaoSocial(value) => _razaoSocial = value;

  String? getNomeFantasia() => _nomeFantasia;

  setNomeFantasia(value) => _nomeFantasia = value;

  int? getCnpj() => _cnpj;

  setCnpj(value) => _cnpj = value;

  void setEndereco(Endereco endereco) {
    _endereco = endereco;
  }

  Endereco? getEndereco() {
    return _endereco;
  }

  String? getTelefone() => this.telefone;

  setTelefone(String? telefone) => this.telefone = telefone;

  getHorarioCadastro() => this.horarioCadastro;

  setHorarioCadastro(horarioCadastro) => this.horarioCadastro = horarioCadastro;

  getSocio() => this.socio;

  setSocio(socio) => this.socio = socio;

  @override
  String toString() {
    return ' ID: $id\n Cnpj: $_cnpj Data Cadastro: $horarioCadastro\n Razão Social: $_razaoSocial\n Nome Fantasia: $_nomeFantasia\n Telefone: $telefone\n Endereço: $_endereco\n Sócio: $socio\n';
  }
}
