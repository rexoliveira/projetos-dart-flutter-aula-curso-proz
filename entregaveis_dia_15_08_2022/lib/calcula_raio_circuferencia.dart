import 'dart:io';

double raioCircunferencia() {
  const double pi = 3.14;
  double raio;
  double medida;

  print("Raio da circuferência");
  print("Insira os valor da circunferência:");
  medida = double.parse(stdin.readLineSync().toString());
 
  raio = medida/(2*pi);
  return raio;
}
