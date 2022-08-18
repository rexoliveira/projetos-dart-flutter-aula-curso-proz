import 'dart:io';
double areaRetangulo() {
  double area;
  double base;
  double altura;

  print("Área do Retângulo");
  print("Insira o valor da base do retângulo");
  base = double.parse(stdin.readLineSync().toString());

  print("Insira o valor da altura do retângulo");
  altura = double.parse(stdin.readLineSync().toString());

  area = base * altura;
  return area;
}
