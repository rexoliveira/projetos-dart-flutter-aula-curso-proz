import 'package:dart_application_final_semana_5/endereco.dart';
import 'package:dart_application_final_semana_5/socio.dart';

class SocioJuridica extends Socio {
  String? razaoSocial;
  String? nomeFantasia;
  int? _Cnpj;

  SocioJuridica({
    required this.razaoSocial,
    required this.nomeFantasia,
    required super.nome,
    super.endereco,
  });

 getCnpj() => this._Cnpj;

 setCnpj(int value) => this._Cnpj = value;

 getEndereco() => this.endereco;

  setEndereco(Endereco endereco) => this.endereco = endereco;


  @override
  String toString() => '\n CNPJ: $_Cnpj\n Razão Social: $razaoSocial\n Nome Fantasia: $nomeFantasia\n Endereço: $endereco\n';
}
