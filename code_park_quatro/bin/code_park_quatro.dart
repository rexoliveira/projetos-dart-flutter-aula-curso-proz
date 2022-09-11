import 'package:code_park_quatro/lemure.dart';
import 'package:code_park_quatro/lontra.dart';
import 'package:code_park_quatro/tartaruga.dart';

void main(List<String> arguments) {
  Tartaruga tartaruga = Tartaruga(
    25.5,
    "terrestre",
  );
  tartaruga.setIdade(10);
  tartaruga.setNome("Tartaruga-da-madeira");
  tartaruga.setIdentificador(1001);
  String comidas = tartaruga.comer("folhas,frutos");  

  print("\x1B[2J\x1B[0;0H");
  print("====================================================");

  print(tartaruga);
  print("  Comidas: $comidas .");

  print("====================================================");

  Lemure lemure = Lemure(
    primatas: true,
    superFamilia: "Lemuroidea",
  );
  lemure.setIdade(2);
  lemure.setNome("Lemur");
  lemure.setIdentificador(1151);
  String comidasLemure = lemure.comer("folhas,vegetais");

  print(lemure);
  print("  Comidas: $comidasLemure .");

  print("====================================================");

  Lontra lontra = Lontra(
    cauda: "cauda robusta",
    habitat: "ambientes de água doce",
  );
  lontra.setIdade(4);
  lontra.setNome("Lontra-neotropical");
  lontra.setIdentificador(9152);
  String comidasLontra = lontra.comer("peixe,insetos,crustáceos");

  print(lontra);
  print("  Comidas: $comidasLontra .");

  print("====================================================");
}
