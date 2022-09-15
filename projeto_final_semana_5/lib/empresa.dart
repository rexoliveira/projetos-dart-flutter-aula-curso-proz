// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:uuid/uuid.dart';

import 'package:projeto_final_semana_5/endereco.dart';

class Empresa {
  Uuid? id;

  String? _razaoSocial;
  String? _nomeFantasia;
  int? _cnpj;
  Endereco? _endereco;

  Uuid? get getId => id;

  setId(Uuid? id) => this.id = id;

  get razaoSocial => _razaoSocial;

  set razaoSocial(value) => _razaoSocial = value;

  get nomeFantasia => _nomeFantasia;

  set nomeFantasia(value) => _nomeFantasia = value;

  get cnpj => _cnpj;

  set cnpj(value) => _cnpj = value;

  void setEndereco(Endereco endereco) {
    _endereco = endereco;
  }

  Endereco? getEndereco() {
    return _endereco;
  }

  @override
  String toString() {
    return 'Empresa(id: ${id!.v4()}, _razaoSocial: $_razaoSocial, _nomeFantasia: $_nomeFantasia, _cnpj: $_cnpj, _endereco: $_endereco.)';
  }
}
