import 'package:code_park_quatro/animal.dart';
import 'package:code_park_quatro/ianimal.dart';

class Tartaruga extends Animal implements Ianimal {
  num? tamanhoCasco;
  String? tipo;

  Tartaruga(
    this.tamanhoCasco,
    this.tipo,
  ) : super(nome: "", identificador: 0, idade: 0);

  @override
  String comer(String comida) {
    return comida;
  }

  @override
  setNome(String? nome) {
    this.nome = nome;
  }

  @override
  getNome() {
    return nome;
  }

  @override
  setIdentificador(identificador) {
    this.identificador = identificador;
  }

  @override
  getIdentificador() {
    return identificador;
  }

  @override
  setIdade(idade) {
    this.idade = idade;
  }

  @override
  getIdade() {
    return idade;
  }

  @override
  String toString() {
    return ' Nome: ${getNome()},\n Idade: ${getIdade()},\n Identificador: ${getIdentificador()},\n Tartaruga:\n  TamanhoCasco: $tamanhoCasco,\n  Tipo: $tipo';
  }
}
