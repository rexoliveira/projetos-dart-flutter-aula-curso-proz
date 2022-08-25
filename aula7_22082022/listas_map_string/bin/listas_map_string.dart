import 'dart:convert';
import 'dart:io';

//Variaveis Lista, valor, entraValor tipo "String" e "num" GLOBAL
final meuExercicios = <String>[];
String valor = inserirValor();
num? entraValor = verificarNumero(valor);

//Metodo MAIN inicia a aplicação
void main(List<String> arguments) {
  String option = "";

  do {
    entraValor = null;
    //Chama o menu de opções
    chamarListaMenu();

    //Caso não digitar números
    entrarDadoMenu();

    //Verifica se a lista está vazia
    verificarLista();

    switch (entraValor) {
      //Sai da aplicação
      case 0:
        sairApp(situacao: entraValor.toString());
        break;
      //Adiciona tema a lista
      case 1:
        imprimirMsg(msgs: 'Digite o tema a ser adicionado a lista ou "Menu": ');
        String thema = inserirValor();
        if (!sairApp(situacao: thema)) {
          break;
        }
        adicionarTema(thema: thema);
        imprimirMsg(msgs: 'Tarefa $thema adicinada a lista!');
        //Limpa a varivel de entrada
        /* entraValor = null; */
        break;
      //Remove o tema da lista mas antes remove o tema
      case 2:
        listarItensLista();
        imprimirMsg(msgs: 'Digite a posição a ser removida ou "Menu": ');
        String posicaoRemover = inserirValor();
        if (!sairApp(situacao: posicaoRemover)) {
          break;
        }
        String temp = removerItem(posicaoRemover: posicaoRemover);
        imprimirMsg(
            msgs:
                'O tema "$temp" foi removido na lista na posição $posicaoRemover !');
        listarItensLista();
        //Limpa a varivel de entrada
        /* entraValor = null; */
        break;
      case 3:
        listarItensLista();
        imprimirMsg(msgs: 'Digite a posição a ser atualizada ou "Menu: ');
        String posicaoAtualizar = inserirValor();
        if (!sairApp(situacao: posicaoAtualizar)) {
          break;
        }
        imprimirMsg(msgs: 'Digite o tema a ser atualizado ou "Menu": ');
        String valor = inserirValor();
        if (!sairApp(situacao: valor)) {
          break;
        }
        String temp =
            atualizarItem(posicaoAtualizar: posicaoAtualizar, valor: valor);
        imprimirMsg(
            msgs:
                'O tema "$temp" foi atualizado na lista na posição $posicaoAtualizar !');
        listarItensLista();
        //Limpa a varivel de entrada
        /* entraValor = null; */
        break;
      case 4:
        imprimirMsg(msgs: 'Lista antes de ser reordenada: ');
        listarItensLista();
        //Verifica a quantidade de itens na lista
        if (meuExercicios.length < 2) {
          imprimirMsg(
              msgs:
                  'Quantidade de valores na lista não atende a reordenação! ');
          entraValor = 1;
          break;
        }
        meuExercicios.shuffle();
        imprimirMsg(msgs: 'Lista após de ser reordenada: ');
        listarItensLista();
        //Limpa a varivel de entrada
        /* entraValor = null; */
        break;
      case 5:
        listarItensLista();
        //Limpa a varivel de entrada
        /* entraValor = null; */
        break;
      default:
        imprimirMsg(msgs: 'Erro; entrada de dados inválida! ');
        sairApp(situacao: "0");
    }
  } while (option != "0");
}

//#############################################################################
//FUNÇÕES

//FUNÇÃO - Menu de opções
void chamarListaMenu() {
  final menu = <String>[
    "Sair da aplicação",
    "Adicionar tema",
    "Remover tema",
    "Atualizar tema",
    "Reordenar lista",
    "Mostrar lista",
  ];
  var i = 0;
  for (i = 1; i < menu.length; i++) {
    imprimirMsg(msgs: "$i) ${menu[i]}");
  }
  //Imprime por ultimo item "Sair do APP"
  imprimirMsg(msgs: "0) ${menu[0]}");
  imprimirMsg(msgs: "Escolha uma das opções acima*:");
  entraValor = verificarNumero(inserirValor());
}

//FUNÇÃO - Verifica se a lis está vazia
void verificarLista() {
  if (meuExercicios.isEmpty && valor != "1" && valor != "0") {
    imprimirMsg(msgs: "Lista vazia!");
    entraValor = 1;
  }
}

//FUNÇÃO - Verifica se é um número e se esta entre 0 e 5
void entrarDadoMenu() {
  while (
      entraValor == null || !(int.parse(valor) >= 0 && int.parse(valor) <= 5)) {
    imprimirMsg(msgs: "(*Escolha somente números inteiros entre 0 e 5!)");
    valor = inserirValor();
    entraValor = verificarNumero(valor);
  }
}

//FUNÇÃO - Voltar ao menu ou sair da aplicação
bool sairApp({required String situacao}) {
  if (situacao.toLowerCase() == "menu") {
    imprimirMsg(msgs: "Retornou ao Menu!");
    /* entraValor = null; */
    return false;
  } else if (situacao == "0") {
    imprimirMsg(msgs: "Saiu da aplicação!");
    /* entraValor = null; */
    exit(0);
  }
  return true;
}

//FUNÇÃO - Entrada de valores tipo "String"
//Retorna valor inserido na entraga do teclado
String inserirValor() {
  String valor = stdin.readLineSync(encoding: utf8)!;
  return valor.trim();
}

//Crédito:https://api.dart.dev/stable/2.14.4/dart-core/num/tryParse.html
//FUNÇÃO - Verifica se é um numero inteiro
//Retorna "null" caso não seja um número inteiro
num? verificarNumero(String valor) {
  String source = valor.trim();
  return int.tryParse(source);
}

//FUNÇÃO - Imprime mensagens
void imprimirMsg({required String msgs}) {
  String msg = msgs;
  return print(msg);
}

//FUNÇÃO - Adiciona o tema alista
void adicionarTema({required String thema}) {
  meuExercicios.add(thema);
}

//FUNÇÃO - Lista itens na lista
void listarItensLista() {
  imprimirMsg(msgs: 'Lista de temas:\n ');
  for (var i = 0; i < meuExercicios.length; i++) {
    imprimirMsg(msgs: 'Posição ${i + 1} : ${meuExercicios[i]}\n ');
  }
}

//FUNÇÃO - remove o item e retorna em "String" o item removido
String removerItem({required String posicaoRemover}) {
  String temp = meuExercicios[int.parse(posicaoRemover) - 1];
  meuExercicios.removeAt(int.parse(posicaoRemover) - 1);

  return temp;
}

//FUNÇÃO - atualiza o item e retorna em "String" o item atualizado
//Para fins didáticos usei INSERT
//Mas pode ser usaldo assim: lista[posição]
String atualizarItem(
    {required String posicaoAtualizar, required String valor}) {
  removerItem(posicaoRemover: posicaoAtualizar);
  meuExercicios.insert(int.parse(posicaoAtualizar) - 1, valor);
  String temp = meuExercicios[int.parse(posicaoAtualizar) - 1];

  return temp;
}
