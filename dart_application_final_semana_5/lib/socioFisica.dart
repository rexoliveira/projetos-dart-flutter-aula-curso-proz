import 'package:dart_application_final_semana_5/endereco.dart';
import 'package:dart_application_final_semana_5/socio.dart';

class SocioFisica extends Socio {
  int? _cpf;

  SocioFisica({
    required super.nome,
    super.endereco,
  });

  getcpf() => this._cpf;

  setCpf(int value) => this._cpf = value;

  getEndereco() => this.endereco;

  setEndereco(Endereco endereco) => this.endereco = endereco;


  @override
  String toString() =>
      '\n CPF: $_cpf\n Nome Completo: $nome\n Endereço: $endereco\n';
}
