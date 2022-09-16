import 'dart:convert';
import 'dart:io';

import 'package:uuid/uuid.dart';

void main(List<String> arguments) {
  File('lib/questions.json').readAsString().then((String contents) {
    var json = jsonDecode(contents);
    print("\x1B[2J\x1B[0;0H");
    bool controleMenu = true;
    int? inputMenu;
    String? processado;

    while (controleMenu) {
      for (var i = 0; i < json[0].length; i++) {
        print(json[0][i.toString()]["0"]);
        if (i >= (json[0].length - 1)) {
          inputMenu = int.parse(stdin.readLineSync().toString());
          if (inputMenu >= 1 && inputMenu <= (json[0].length - 1)) {
            for (var e = 0;
                e < json[0][(inputMenu - 1).toString()].length;
                e++) {
              print(json[0][(inputMenu - 1).toString()][e.toString()]);
              if (e != 0) {
                processado = processaCadastroEmpresa(e, json);
              }
            }
          } else if (inputMenu == 6) {
            controleMenu = false;
            print(json[4]["out0"]);
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
String processaCadastroEmpresa(int codigo, json) {
  late String entrada = stdin.readLineSync().toString();
  print("\nCodigo entrada Emp: $codigo -> Entrada: $entrada\n");

  if (codigo == 11) {
    bool processaSocio = true;
    while (processaSocio) {
      for (var i = 0; i < json[int.parse(entrada)].length; i++) {
        String p = (int.parse(entrada) == 1) ? "f" : "j";
        print(json[int.parse(entrada)][p + i.toString()]);
        final String entradaSocio = stdin.readLineSync().toString();
        print("\nCodigo entrada Soc: $i -> Entrada: $entradaSocio\n");
      }
      
      for (var e = 0; e < json[3].length; e++) {
        print(json[3]["e" + e.toString()]);
        final String entradaEnderecoSocio = stdin.readLineSync().toString();
        print(
            "\nCodigo entrada SocEnd: $e -> Entrada: $entradaEnderecoSocio\n");
      }
      print(json[6]["alert0"]);
      final String entradaNovoSocio = stdin.readLineSync().toString();
      print("\nCodigo entrada NovSoc: 6 -> Entrada: $entradaNovoSocio\n");
      if(entradaNovoSocio.toLowerCase() == "s") {
         print(json[0]["0"]["11"]);
         entrada = stdin.readLineSync().toString();
      }else{
        processaSocio = false;
      }

    }
  }
  return entrada;
}
