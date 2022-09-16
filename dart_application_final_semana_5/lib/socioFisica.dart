import 'package:dart_application_final_semana_5/endereco.dart';
import 'package:dart_application_final_semana_5/socio.dart';

class SocioFisica extends Socio {
  String _cpf = "";

  SocioFisica({
    super.nome,
    super.endereco,
  });

  geNome() => this.nome;

  setNome(nome) => this.nome = nome;

  get getcpf {
    RegExp regExp = RegExp(r'^(\d{3})(\d{3})(\d{3})(\d{2})$');

    return this._cpf.replaceAllMapped(
        regExp, (Match m) => "${m[1]}.${m[2]}.${m[3]}-${m[4]}");
  }

  setCpf(value) => this._cpf = value;

  getEndereco() => this.endereco;

  setEndereco(Endereco endereco) => this.endereco = endereco;

  @override
  String toString() =>
      '\n CPF: $_cpf\n Nome Completo: $nome\n Endereço: $endereco\n';
}
