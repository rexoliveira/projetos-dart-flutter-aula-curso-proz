import 'package:uuid/uuid.dart';

import 'package:dart_application_final_semana_5/empresa.dart';
import 'package:dart_application_final_semana_5/endereco.dart';
import 'package:dart_application_final_semana_5/socioFisica.dart';
import 'package:dart_application_final_semana_5/socioJuridica.dart';

void main(List<String> arguments) {
  var uuid = Uuid();
  Empresa empresa1 = Empresa();
  Endereco enderecoEmpresa = Endereco();
  Endereco enderecoSocio = Endereco();

  SocioFisica socioFisica = SocioFisica(nome: "Rodrigo");
  enderecoSocio.setLogradouro("Rua Y");
  enderecoSocio.setNumero(111);

  socioFisica.setEndereco(enderecoSocio);

  enderecoEmpresa.setLogradouro("Rua x");
  enderecoEmpresa.setNumero(123);

  empresa1.setId(uuid.v4());
  empresa1.setSocio(socioFisica);
  empresa1.setHorarioCadastro(DateTime.now().toString());
  empresa1.setEndereco(enderecoEmpresa);
  print("\x1B[2J\x1B[0;0H");
  print(empresa1);
  //============================================================
  Empresa empresa2 = Empresa();
  SocioJuridica socioJuridica = SocioJuridica(
      razaoSocial: "razaoSocial", nomeFantasia: "nomeFantasia", nome: "nome");
  // socioJuridica.setCnpj(12322232325656565);
  enderecoSocio.setLogradouro("Rua W");
  enderecoSocio.setNumero(333);

  socioJuridica.setEndereco(enderecoSocio);

  enderecoEmpresa.setLogradouro("Rua Z");
  enderecoEmpresa.setNumero(55);

  empresa2.setId("uuid.v4()");
  empresa2.setSocio(socioJuridica);
  empresa2.setHorarioCadastro(DateTime.now().toString());
  empresa2.setEndereco(enderecoEmpresa);

  print(empresa2);
}
