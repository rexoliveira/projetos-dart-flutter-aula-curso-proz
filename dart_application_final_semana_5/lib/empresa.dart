import 'package:dart_application_final_semana_5/endereco.dart';
import 'package:dart_application_final_semana_5/socio.dart';

class Empresa {
  String? id;
  String? _razaoSocial;
  String? _nomeFantasia;
  String _cnpj = "";
  Endereco? _endereco;

  String telefone = "";
  String? horarioCadastro;
  Socio? socio;

  String? get getId => id;

  setId(String? id) => this.id = id;

  String? getRazaoSocial() => _razaoSocial;

  setRazaoSocial(value) => _razaoSocial = value;

  String? getNomeFantasia() => _nomeFantasia;

  setNomeFantasia(value) => _nomeFantasia = value;

  get getCnpj {
    RegExp regExp = RegExp(r'^(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})');

    return this._cnpj.replaceAllMapped(
        regExp, (Match m) => "${m[1]}.${m[2]}.${m[3]}/${m[4]}-${m[5]}");
  }

  setCnpj(String value) => _cnpj = value;

  void setEndereco(Endereco endereco) {
    _endereco = endereco;
  }

  Endereco? getEndereco() {
    return _endereco;
  }

   get getTelefone {
    RegExp regExp = RegExp(r'^(\d{2})(\d{1})(\d{4})(\d{4})$');

    return this.telefone.replaceAllMapped(
        regExp, (Match m) => "(${m[1]}) ${m[2]} ${m[3]}-${m[4]}");
  }

  setTelefone(String telefone) => this.telefone = telefone;

  getHorarioCadastro() => this.horarioCadastro;

  setHorarioCadastro(horarioCadastro) => this.horarioCadastro = horarioCadastro;

  getSocio() => this.socio;

  setSocio(socio) => this.socio = socio;

  @override
  String toString() {
    return ' ID: $id\n Cnpj: $_cnpj Data Cadastro: $horarioCadastro\n Razão Social: $_razaoSocial\n Nome Fantasia: $_nomeFantasia\n Telefone: $telefone\n Endereço: $_endereco\n Sócio: $socio\n';
  }
}
