abstract class Animal {
  String? nome;
  int? identificador;
  int? idade;

  Animal({
    required this.nome,
    required this.identificador,
    required this.idade,
  });

  @override
  String toString() =>
      'Animal(nome: $nome, identificador: $identificador, idade: $idade)';
}
