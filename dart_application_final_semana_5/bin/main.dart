import 'dart:convert';
import 'dart:io';

import 'package:dart_application_final_semana_5/empresa.dart';
import 'package:dart_application_final_semana_5/endereco.dart';
import 'package:dart_application_final_semana_5/socioFisica.dart';
import 'package:dart_application_final_semana_5/socioJuridica.dart';
import 'package:uuid/uuid.dart';

var json;
void main(List<String> arguments) {
  File('lib/questions.json').readAsString().then((String contents) {
    //TODO: tratar
    json = jsonDecode(contents);
    print("\x1B[2J\x1B[0;0H");
    bool controleMenu = true;
    int? inputMenu;

    while (controleMenu) {
      for (var i = 0; i < json[0].length; i++) {
        print(json[0][i.toString()]["0"]);
        if (i >= (json[0].length - 1)) {
          inputMenu = int.parse(stdin.readLineSync().toString());
          if (inputMenu >= 1 &&
              inputMenu <= (json[0].length - 1) &&
              inputMenu != 4) {
            for (var e = 0;
                e < json[0][(inputMenu - 1).toString()].length;
                e++) {
              //Imprime as questions
              print(json[0][(inputMenu - 1).toString()][e.toString()]);

              if (e != 0) {
                processaEntradaEmpresa(e);
              }
            }
          } else if (inputMenu == 6) {
            controleMenu = false;
            print(json[4]["out0"]);
          } else if (inputMenu == 4) {
            print(json[0]["3"]["1"]);
            var entrada = stdin.readLineSync();
            listarEmpresas(entrada!.toLowerCase());
          } else {
            print(json[5]["erro0"]);
          }
        }
      }
    }
  });
}

/**
   * Processa dados da empresa
   * Processa dados do socio Juridico ou Físico
   */
Map<String, dynamic> processaEntradaEmpresa(int codigo) {
  Map<String, dynamic> processaEntrada = {};

  late String entrada = stdin.readLineSync().toString();
  print("\nCodigo entrada Emp: $codigo -> Entrada: $entrada\n");

  processaEntrada['entrada'] = entrada;
  processaEntrada['codigo'] = codigo;

  while (entrada != "1" && entrada != "2" && codigo == 11) {
    print(json[6]["alert1"]);
    entrada = stdin.readLineSync().toString();
  }

  if (codigo == 11) {
    bool processaSocio = true;
    while (processaSocio) {
      for (var i = 0; i < json[int.parse(entrada)].length; i++) {
        String p = (int.parse(entrada) == 1) ? "f" : "j";

        //Imprime as questions
        print(json[int.parse(entrada)][p + i.toString()]);

        final String entradaSocio = stdin.readLineSync().toString();
        print("\nCodigo entrada Soc: $i -> Entrada: $entradaSocio\n");

        processaEntrada['socio'] = p;
        processaEntrada['codigo-socio'] = p + i.toString();
        processaEntrada['entrada'] = entradaSocio;
        processaCadastroEmpresa(processaEntrada);
      }

      for (var e = 0; e < json[3].length; e++) {
        print(json[3]["e" + e.toString()]);
        final String entradaEnderecoSocio = stdin.readLineSync().toString();
        print(
            "\nCodigo entrada SocEnd: $e -> Entrada: $entradaEnderecoSocio\n");
        processaEntrada['codigo-socio'] = "e" + e.toString();
        processaEntrada['entrada'] = entradaEnderecoSocio;
        processaCadastroEmpresa(processaEntrada);
      }
      print(json[6]["alert0"]);
      final String entradaNovoSocio = stdin.readLineSync().toString();
      print("\nCodigo entrada NovSoc: 6 -> Entrada: $entradaNovoSocio\n");
      if (entradaNovoSocio.toLowerCase() == "s") {
        processaSocio = false;
      }
    }
  }
  processaCadastroEmpresa(processaEntrada);
  return processaEntrada;
}

Empresa empresa = Empresa();
Endereco enderecoEmpresa = Endereco();
SocioJuridica socioJuridica = SocioJuridica();
Endereco enderecoSocioJ = Endereco();
SocioFisica socioFisica = SocioFisica();
Endereco enderecoSocioF = Endereco();
final listaEmpresas = <Map<String, dynamic>>[];
void processaCadastroEmpresa(Map<String, dynamic> processo) {
  var uuid = Uuid();
  var criaEmpresa = false;
  if (processo['codigo'] >= 0 && processo['codigo'] <= 10) {
    switch (processo['codigo']) {
      case 1:
        empresa.setRazaoSocial(processo['entrada']);
        break;
      case 2:
        empresa.setNomeFantasia(processo['entrada']);
        break;
      case 3:
        empresa.setId(uuid.v4());
        empresa.setCnpj(processo['entrada']);
        empresa.setHorarioCadastro(DateTime.now().toString());
        break;
      case 4:
        enderecoEmpresa.setLogradouro(processo['entrada']);
        break;
      case 5:
        enderecoEmpresa.setNumero(int.parse(processo['entrada']));
        break;
      case 6:
        enderecoEmpresa.setBairro(processo['entrada']);
        break;
      case 7:
        enderecoEmpresa.setEstadoSigla(processo['entrada']);
        break;
      case 8:
        enderecoEmpresa.setCep(processo['entrada']);
        break;
      case 9:
        enderecoEmpresa.setComplemento(processo['entrada']);
        empresa.setEndereco(enderecoEmpresa);
        break;
      case 10:
        empresa.setTelefone(processo['entrada']);
        break;
      default:
        print(json[5]["erro1"]);
    }
  }

  if (processo['socio'] == "f") {
    switch (processo['codigo-socio']) {
      case "f0":
        socioFisica.setNome(processo['entrada']);
        break;
      case "f1":
        socioFisica.setCpf(processo['entrada']);
        break;
      case "e0":
        enderecoSocioF.setLogradouro(processo['entrada']);
        break;
      case "e1":
        enderecoSocioF.setNumero(int.parse(processo['entrada']));
        break;
      case "e2":
        enderecoSocioF.setBairro(processo['entrada']);
        break;
      case "e3":
        enderecoSocioF.setEstadoSigla(processo['entrada']);
        break;
      case "e4":
        enderecoSocioF.setCep(processo['entrada']);
        break;
      case "e5":
        enderecoSocioF.setComplemento(processo['entrada']);
        socioFisica.setEndereco(enderecoSocioF);
        criaEmpresa = (empresa.setSocio(socioFisica) is SocioFisica);
        break;
      default:
        print(json[5]["erro2"]);
    }
  } else if (processo['socio'] == "j") {
    switch (processo['codigo-socio']) {
      case "j0":
        socioJuridica.setNome(processo['entrada']);
        break;
      case "j1":
        socioJuridica.setRazaoSocial(processo['entrada']);
        break;
      case "j2":
        socioJuridica.setNomeFantasia(processo['entrada']);
        break;
      case "j3":
        socioJuridica.setCnpj(processo['entrada']);
        break;
      case "e0":
        enderecoSocioJ.setLogradouro(processo['entrada']);
        break;
      case "e1":
        enderecoSocioJ.setNumero(int.parse(processo['entrada']));
        break;
      case "e2":
        enderecoSocioJ.setBairro(processo['entrada']);
        break;
      case "e3":
        enderecoSocioJ.setEstadoSigla(processo['entrada']);
        break;
      case "e4":
        enderecoSocioJ.setCep(processo['entrada']);
        break;
      case "e5":
        enderecoSocioJ.setComplemento(processo['entrada']);
        socioJuridica.setEndereco(enderecoSocioJ);
        criaEmpresa = (empresa.setSocio(socioJuridica) is SocioJuridica);
        break;
      default:
        print(json[5]["erro3"]);
    }
  }

  if (criaEmpresa) {
    print("\x1B[2J\x1B[0;0H");
    adicionarEmpresa(empresa, socioJuridica, socioFisica, processo);
  }
}

void adicionarEmpresa(Empresa empresa, SocioJuridica socioJuridica,
    SocioFisica socioFisica, processo) {
  Map<String, List<dynamic>> addEmpresa = {};

  if (processo['socio'] == "f") {
    addEmpresa['id'] = [empresa.getId];
    addEmpresa['cnpj'] = [empresa.getCnpj];
    addEmpresa['razaoSocial'] = [empresa.getRazaoSocial()];
    addEmpresa['nomeFatasia'] = [empresa.getNomeFantasia()];
    addEmpresa['telefone'] = [empresa.getTelefone];
    addEmpresa['endereco'] = [empresa.getEndereco()];
    addEmpresa['socio'] = [
      socioFisica.nome,
      socioFisica.getcpf,
      socioFisica.getEndereco()
    ];
    listaEmpresas.add(addEmpresa);
  } else if (processo['socio'] == "j") {
    addEmpresa['id'] = [empresa.getId];
    addEmpresa['cnpj'] = [empresa.getCnpj];
    addEmpresa['razaoSocial'] = [empresa.getRazaoSocial()];
    addEmpresa['nomeFatasia'] = [empresa.getNomeFantasia()];
    addEmpresa['telefone'] = [empresa.getTelefone];
    addEmpresa['endereco'] = [empresa.getEndereco()];
    addEmpresa['socio'] = [
      socioJuridica.getCnpj,
      socioJuridica.getRazaoSocial(),
      socioJuridica.getNomeFantasia(),
      socioJuridica.getEndereco(),
    ];
    listaEmpresas.add(addEmpresa);
  }
}

void listarEmpresas(listar) {
  if (listar == "f") {
    print("object" + listaEmpresas.length.toString());
    for (var element in listaEmpresas) {
      print("ID: " + element['id'][0]);
      print("CNPJ: " + element['cnpj'][0]);
      print("Razão Social: " + element['razaoSocial'][0]);
      print("Nome Fantasia: " + element['nomeFatasia'][0]);
      print("Telefone: " + element['telefone'][0]);
      print("Endereço: " + element['endereco'][0].toString());
      print("Sócio:");
      print("CPF: " + element['socio'][1]);
      print("Nome Completo : " + element['socio'][0]);
      print("Endereço: " + element['socio'][2].toString());
    }
  } else if (listar == "j") {
    for (var element in listaEmpresas) {
      print("ID: " + element['id'][0]);
      print("CNPJ: " + element['cnpj'][0]);
      print("Razão Social: " + element['razaoSocial'][0]);
      print("Nome Fantasia: " + element['nomeFatasia'][0]);
      print("Telefone: " + element['telefone'][0]);
      print("Endereço: " + element['endereco'][0].toString());
      print("Sócio:");
      print("CNPJ: " + element['socio'][0]);
      print("Razão Social : " + element['socio'][1]);
      print("Nome Fantasia: " + element['socio'][2]);
      print("Endereço: " + element['socio'][3].toString());
    }
  }
}
