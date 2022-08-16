import 'dart:io';

void main() {
  double x;
  double y;
  print("======================================");
  print("Entre com o valor de  X:");
  x = double.parse(stdin.readLineSync().toString());
  print("======================================");
  print("Entre com o valor de Y:");
  y = double.parse(stdin.readLineSync().toString());
  print("======================================");

  if (x > 0 && y > 0) {
//1º quadrante, os valores de x e de y são positivos → (+, +)
    print("Primeiro quadrante\n");

  } else if (x < 0 && y > 0) {
//2º quadrante, o valor de x é negativo e o de y é positivo → (–, +)
    print("Segundo quadrante\n");

  } else if (x < 0 && y < 0) {
//3º quadrante, os valores de x e de y são negativos → (– , –)
    print("Terceiro quadrante\n");

  } else {
//4º quadrante, o valor de x é positivo e o de y é negativo → (+, –)
    print("Quarto quadrante\n");
  }
}

//Crédito:https://www.preparaenem.com/matematica/plano-cartesiano.html
