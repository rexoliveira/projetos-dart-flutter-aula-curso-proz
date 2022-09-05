import 'package:code_park_dois/livro.dart';

void main(List<String> arguments) {
  //Instância do Livro um
  var livro1 = Livro(
    nome: "Sonhor dos Aneis - O Hobbit",
    quantidadePaginas: 500,
    autor: "J. R. R. Tolkien",
    ano: 1937,
  );

  //Limpa o terminal antes de imprimir as instâncias criadas
  print("\x1B[2J\x1B[0;0H");
  //Imprime usando metodo @override "toString() definido na Classe Livro"
  print(livro1);
  print("============================================");

  //Instância do Livro dois
  var livro2 = Livro(
      nome: "O Senhor dos Anéis: A Sociedade do Anel",
      quantidadePaginas: 430,
      autor: "J. R. R. Tolkien",
      ano: 1954,
      penalidadeAtraso: true);
      
  //Metodo define o valor da multa;
  //Por ser um metodo privado só pode ser acessado caso exista Get e Set;
  //Só será impresso esse valor caso "penalidadeAtraso" for definida como "TRUE",
  //mesmo qua haja um valor definido aqui
  livro2.setMultaAtraso(0.99);
  print(livro2);
  print("============================================");

  //Instância do Livro dois
  var livro3 = Livro(
      nome: "O Senhor dos Anéis: O retorno do Rei",
      quantidadePaginas: 121,
      autor: "J. R. R. Tolkien",
      ano: 1955,
      penalidadeAtraso: false);
      
  //Metodo define o valor da multa;
  //Por ser um metodo privado só pode ser acessado caso exista Get e Set;
  //Só será impresso esse valor caso "penalidadeAtraso" for definida como "TRUE",
  //mesmo qua haja um valor definido aqui
  livro3.setMultaAtraso(2.95);
  print(livro3);
  print("============================================");
}

