import 'package:dart_application_final_semana_5/endereco.dart';
import 'package:dart_application_final_semana_5/socio.dart';

class SocioJuridica extends Socio {
  String? razaoSocial;
  String? nomeFantasia;
  String _cnpj = "";

  SocioJuridica({
    super.nome,
    this.razaoSocial,
    this.nomeFantasia,
    super.endereco,
  });

  geNome() => this.nome;

  setNome(nome) => this.nome = nome;

  getRazaoSocial() => this.razaoSocial;

  setRazaoSocial(razaoSocial) => this.razaoSocial = razaoSocial;

  getNomeFantasia() => this.nomeFantasia;

  setNomeFantasia(nomeFantasia) => this.nomeFantasia = nomeFantasia;

  get getCnpj {
    RegExp regExp = RegExp(r'^(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})');

    return this._cnpj.replaceAllMapped(
        regExp, (Match m) => "${m[1]}.${m[2]}.${m[3]}/${m[4]}-${m[5]}");
  }

  setCnpj(String value) => this._cnpj = value;

  getEndereco() => this.endereco;

  setEndereco(Endereco endereco) => this.endereco = endereco;

  @override
  String toString() =>
      '\n CNPJ: $_cnpj\n Razão Social: $razaoSocial\n Nome Fantasia: $nomeFantasia\n Endereço: $endereco\n';
}
