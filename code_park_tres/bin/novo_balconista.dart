import 'package:code_park_tres/balconista.dart';

void main(List<String> arguments) {
  var balconista = Balconista(nome: "Pedro");

  balconista.setSenha("1234");
  balconista.setNivel(6);

  print(balconista);
}
