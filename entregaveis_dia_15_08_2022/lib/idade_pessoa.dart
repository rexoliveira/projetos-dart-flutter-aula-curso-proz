import 'dart:io';

int calculaIdada() {
  const int diasAno = 365;
  const int diasMes = 30;
  int dias;
  int anos;
  int meses;

  print("Calculo da idade");
  print("Insira o valor da sua idade anos");
  anos = int.parse(stdin.readLineSync().toString());

  print("Insira o valor da sua idade meses");
  meses = int.parse(stdin.readLineSync().toString());

  print("Insira o valor da sua idade dias");
  dias = int.parse(stdin.readLineSync().toString());

  dias += (anos * diasAno) + (meses * diasMes);

  return dias;
}
