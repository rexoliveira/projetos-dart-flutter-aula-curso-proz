import 'package:code_park_quatro/animal.dart';
import 'package:code_park_quatro/ianimal.dart';

class Lontra extends Animal implements Ianimal {
  String habitat;
  String? cauda;

  Lontra({required this.habitat, required this.cauda})
      : super(nome: "", identificador: 0, idade: 0);

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
    return ' Nome: ${getNome()},\n Idade: ${getIdade()},\n Identificador: ${getIdentificador()},\n Lontra:\n  Habitat: $habitat,\n  Cauda: $cauda';
  }
}
