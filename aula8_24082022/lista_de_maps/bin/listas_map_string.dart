import 'dart:convert';
import 'dart:io';

//Variaveis GLOBAIS Lista, entraValor
final meuExercicios = <String>[];
num? entraValor;
List<String> menu = <String>[];

//Metodo MAIN inicia a aplicação
void main(List<String> arguments) {
  //Limpa o terminal
  print("\x1B[2J\x1B[0;0H");
  do {
    //Chama o menu de opções
    chamarListaMenu();

    //Caso não digitar números
    entrarDadoMenu();

    //Verifica se a lista está vazia
    verificarLista();

    //Define as funções conforme opção do Menu
    switch (entraValor) {

      //SAI da aplicação
      case 0:
        sairPara(situacao: entraValor.toString());
        break;
      //ADICIONA tema a lista

      case 1:
        imprimirMsg(msgs: 'Digite o tema a ser adicionado a lista ou "Menu": ');
        String thema = inserirValor();
        if (!sairPara(situacao: thema)) {
          break;
        }
        adicionarTema(thema: thema);
        imprimirMsg(msgs: 'Tarefa $thema adicinada a lista!');
        listarItensLista();
        break;

      //REMOVE o tema da lista mas antes remove o tema
      case 2:
        listarItensLista();
        imprimirMsg(msgs: 'Digite a posição a ser removida ou "Menu": ');
        String posicaoRemover = inserirValor();
        if (!sairPara(situacao: posicaoRemover)) {
          break;
        }
        if (meuExercicios.length < int.parse(posicaoRemover)) {
          imprimirMsg(
              msgs: "Não contém a posição $posicaoRemover para ser removida");
          break;
        } else {
          String temp = removerItem(posicaoRemover: posicaoRemover);
          imprimirMsg(
              msgs:
                  'O tema "$temp" foi removido na lista na posição $posicaoRemover !');
          listarItensLista();
        }
        break;

      //ATUALIZA lista
      case 3:
        listarItensLista();
        imprimirMsg(msgs: 'Digite a posição a ser atualizada ou "Menu: ');
        String posicaoAtualizar = inserirValor();
        if (!sairPara(situacao: posicaoAtualizar)) {
          break;
        }
        if (meuExercicios.length < int.parse(posicaoAtualizar)) {
          imprimirMsg(
              msgs:
                  "Não contém a posição $posicaoAtualizar para ser atualizada");
          break;
        } else {
          imprimirMsg(msgs: 'Digite o tema a ser atualizado ou "Menu": ');
          String valor = inserirValor();
          if (!sairPara(situacao: valor)) {
            break;
          }
          String temp =
              atualizarItem(posicaoAtualizar: posicaoAtualizar, valor: valor);
          imprimirMsg(
              msgs:
                  'O tema "$temp" foi atualizado na lista na posição $posicaoAtualizar !');
          listarItensLista();
        }
        break;

      //REORDENA a lista
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
        break;

      //LISTAR conteudo da lista
      case 5:
        imprimirMsg(msgs: 'Lista antes de ordernar: ');
        listarItensLista();
        //Verifica a quantidade de itens na lista
        if (meuExercicios.length < 2) {
          imprimirMsg(
              msgs:
                  'Quantidade de valores na lista não atende a reordenação! ');
          entraValor = 1;
          break;
        }
        imprimirMsg(
            msgs: "Forma CRESCENTE digite 1\n Forma DECRESCENTE digite 2");
        ordenar(tipo: inserirValor());
        imprimirMsg(msgs: 'Lista após ordenar: ');
        listarItensLista();
        break;

      //LISTAR conteudo da lista
      case 6:
        listarItensLista();
        break;

      //ERRO: Caso algo seja digitado errado
      default:
        imprimirMsg(msgs: 'Erro: entrada de dados inválida! ');
        sairPara(situacao: "0");
    }
  } while (entraValor != 0);
}

//#############################################################################
//FUNÇÕES

//FUNÇÃO - Menu de opções
void chamarListaMenu() {
  menu = [
    "Sair da aplicação",
    "Adicionar tema",
    "Remover tema",
    "Atualizar tema",
    "Reordenar lista",
    "Ordenar como?",
    "Mostrar lista",
  ];
  var i = 0;
  //Imprime os itens da lista
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
  if (meuExercicios.isEmpty && entraValor! != 1 && entraValor! != 0) {
    imprimirMsg(msgs: "Lista vazia!");
    entraValor = 1;
  }
}

//FUNÇÃO - Verifica se é um número e se esta entre 0 e 5
void entrarDadoMenu() {
  while (
      entraValor == null || !(entraValor! >= 0 && entraValor! <= menu.length)) {
    imprimirMsg(
        msgs: "(*Escolha somente números inteiros entre 0 e ${menu.length}!)");
    entraValor = verificarNumero(inserirValor());
  }
}

//FUNÇÃO - Voltar ao menu ou sai da aplicação
bool sairPara({required String situacao}) {
  if (situacao.toLowerCase() == "menu") {
    imprimirMsg(msgs: "Retornou ao Menu!");
    return false;
  } else if (situacao == "0") {
    imprimirMsg(msgs: "Saiu da aplicação!");
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

void ordenar({required String tipo}) {
  if (tipo == "1") {
    meuExercicios.sort((a, b) => a.compareTo(b));
  } else if (tipo == "2") {
    meuExercicios.sort((a, b) => b.compareTo(a));
  } else {
    imprimirMsg(msgs: "Função $tipo não definida");
    sairPara(situacao: "menu");
  }
}
