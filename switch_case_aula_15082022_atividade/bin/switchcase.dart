import 'dart:io';

void main() {
  double valor;
  int opcao;

  print("======================================");

  //Solicitar valor ao usuário
  print("Digite o valor total da compra:");
  print("(*Use ponto de vez de vírgula)");

  //Campo de entrada de valor
  valor = double.parse(stdin.readLineSync().toString());

  print("======================================");

  //Solicitar escolha ao usuário
  print("Escolha uma das opções abaixo entre 1 e 4:");
  //Menu de opções
  print("1-Funcionário");
  print("2-Cliente VIP");
  print("3-Cliente comum");
  print("4-Sair");
  //Campo de opções
  opcao = int.parse(stdin.readLineSync().toString());

  print("======================================");

  //-toStringAsFixed(2)-define em duas casas decimais

  //Seleção conforme opção do usuário
  switch (opcao) {
    //Desconto de 10% para funcionário
    case 1:
      double valorDesconto = valor * 10 / 100;
      double desconto = valor - valorDesconto;
      print(
          "Valor total da compra com o desconto foi de R\$ ${desconto.toStringAsFixed(2)}.");
      break;
    //Desconto de 5% para cliente vip
    case 2:
      double valorDesconto = valor * 5 / 100;
      double desconto = valor - valorDesconto;
      print(
          "Valor total da compra com o desconto foi de R\$ ${desconto.toStringAsFixed(2)}.");
      break;
    //Sem desconto para cliente comum
    case 3:
      print(
          "Valor total da compra foi de R\$ ${valor.toStringAsFixed(2)}. Algo mais?");
      break;
    //Cliente saiu do app
    case 4:
      print(
          "Valor total da compra com o foi de R\$ ${valor.toStringAsFixed(2)}. Obrigado pela compra!");
      break;
    //Opção incorreta
    default:
      print("Opção não encontrada!");
      return;
  }
}
