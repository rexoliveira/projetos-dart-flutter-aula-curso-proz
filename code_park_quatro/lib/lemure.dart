import 'animal.dart';
import 'ianimal.dart';

class Lemure extends Animal implements Ianimal {
  bool primatas;
  String? superFamilia;

  Lemure({required this.primatas, required this.superFamilia})
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
    return ' Nome: ${getNome()},\n Idade: ${getIdade()},\n Identificador: ${getIdentificador()},\n Lêmure:\n  Primatas: $primatas,\n  Superfamília : $superFamilia';
  }
}
