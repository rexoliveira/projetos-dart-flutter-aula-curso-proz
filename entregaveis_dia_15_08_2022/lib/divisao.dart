import 'dart:io';
double divisaoCalculo() {
  double numeroUm;
  double numeroDois;
  double total;

  print("A divisao entre dois números");
  print("Entre com  1º valor:");
  numeroUm = double.parse(stdin.readLineSync().toString());

  print("Entre com  2º valor:");
  numeroDois = double.parse(stdin.readLineSync().toString());

  total = numeroUm / numeroDois;
  return total;
}
