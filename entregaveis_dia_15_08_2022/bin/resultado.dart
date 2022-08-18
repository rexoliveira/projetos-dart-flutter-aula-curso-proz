import 'package:entregaveis_dia_15_08_2022/soma.dart' as soma;
import 'package:entregaveis_dia_15_08_2022/diferenca.dart' as diferenca;
import 'package:entregaveis_dia_15_08_2022/multiplica.dart' as multiplica;
import 'package:entregaveis_dia_15_08_2022/divisao.dart' as divisao;
import 'package:entregaveis_dia_15_08_2022/calcula_area_retangulo.dart'
    as retangulo;
import 'package:entregaveis_dia_15_08_2022/calcula_raio_circuferencia.dart'
    as circunferencia;
import 'package:entregaveis_dia_15_08_2022/idade_pessoa.dart' as idadepessoa;

void main(List<String> arguments) {
  print(
      'A  soma entre dois números é : ${soma.somaCalculo().toStringAsFixed(2)}');
  print(
      'A  diferença entre dois números é : ${diferenca.diferencaCalcula().toStringAsFixed(2)}');
  print(
      'A  multiplicação entre dois números é : ${multiplica.multiplicaCalculo().toStringAsFixed(2)}');
  print(
      'A  divisão entre dois números é : ${divisao.divisaoCalculo().toStringAsFixed(2)}');
  print(
      'A  área de um retânguo é: ${retangulo.areaRetangulo().toStringAsFixed(2)}');
  print(
      'O raio da circunferência é: ${circunferencia.raioCircunferencia().toStringAsFixed(2)}');
  print("Sua idade em dias é de ${idadepessoa.calculaIdada()} dias");
}
