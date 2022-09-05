import 'package:code_park_tres/balconista.dart';

void main(List<String> arguments) {
  var balconista = Balconista(nome: "Pedro");

  balconista.setSenha("123456");
  balconista.setNivel(1);

  print(balconista);
}
