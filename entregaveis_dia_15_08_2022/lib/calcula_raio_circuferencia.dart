import 'dart:io';

double raioCircunferencia() {
  const double pi = 3.14;
  double raio;
  double medida;

  print("Raio da circuferĂȘncia");
  print("Insira os valor da circunferĂȘncia:");
  medida = double.parse(stdin.readLineSync().toString());
 
  raio = medida/(2*pi);
  return raio;
}
