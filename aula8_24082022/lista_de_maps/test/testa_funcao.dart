/* import 'dart:convert';

import 'dart:io';

List minhaMusicas = <Map<String, dynamic>>[];
void main() {
  print("\x1B[2J\x1B[0;0H");
  List<String> propriedades = <String>[
    'nome',
    'duracao',
    /* "autor",
    "cantor",
    "album",
    "nacionalidade",
    "anoLancamento" */
  ];
  Map<String, dynamic> temp = {};
  
  for (var i = 0; i < 1; i++) {
    for (var element in propriedades) {
      print("Digite um $element:");
      String? propriedade = stdin.readLineSync(encoding: utf8);
      temp[element] = "'$propriedade'";
    }
    Map<String, dynamic> musica = temp;
    minhaMusicas.add(musica);
  }
  print(minhaMusicas);

  print("===================================");
  //updateKey('nome', 'pedro');
  /* print(minhaMusicas[0].update('nome', (value) => 'Pedro'));

  print(minhaMusicas); */
minhaMusicas[0].update('key1', (value) => '');

print(minhaMusicas);
} */

