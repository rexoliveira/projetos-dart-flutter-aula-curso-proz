import 'dart:convert';
import 'dart:io';

//Variaveis GLOBAIS Lista de Maps, entraValor
final minhasMusicas = <Map<String, dynamic>>[];
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

      //ADICIONA música a lista
      case 1:
        String msg = adicionarMusica();
        if (!sairPara(situacao: msg)) {
          break;
        }

        break;

      //REMOVE o música da lista mas antes remove o música
      case 2:
        String msg = removerItem();
        if (!sairPara(situacao: msg)) {
          break;
        }
        break;

      //ATUALIZA lista
      case 3:
        String msg = atualizarItem();
        if (!sairPara(situacao: msg)) {
          break;
        }
        break;

      //REORDENA a lista
      case 4:
        listaReordenada();
        break;
      //LISTAR conteudo da lista
      case 5:
        /* imprimirMsg(msgs: 'Lista antes de ordernar: ');
        listarItensLista(dalay: false);
        //Verifica a quantidade de itens na lista
        if (minhasMusicas.length < 2) {
          imprimirMsg(
              msgs:
                  'Quantidade de valores na lista não atende a reordenação! ');
          entraValor = 1;
          break;
        }
        imprimirMsg(
            msgs: "Forma CRESCENTE digite 1\n Forma DECRESCENTE digite 2");
        ordenar(tipo: inserirValorTeclado());
        imprimirMsg(msgs: 'Lista após ordenar: ');
        listarItensLista(dalay: false); */
        dalayAcao(
            ativo: true, duracaoSeg: 2, msg: "Opção desabilitada, aguarde");
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
    "Adicionar música",
    "Remover música",
    "Atualizar música",
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
  entraValor = verificarNumero(
      inserirValorTeclado(msg: "Escolha uma das opções acima*:"));
  imprimirMsg(msgs: "======================${menu[int.parse(entraValor.toString())]}======================");
}

//FUNÇÃO - Verifica se a lis está vazia
void verificarLista() {
  if (minhasMusicas.isEmpty && entraValor! != 1 && entraValor! != 0) {
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
    entraValor = verificarNumero(inserirValorTeclado());
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

//OK
//FUNÇÃO - Entrada de valores tipo "String"
//Retorna valor inserido na entraga do teclado
//Ação 1-Insere no Map e 2-Atualiza elementos no Map
String inserirValorTeclado({String? elemento, String? msg, int? acao}) {
  String dado = "";

  do {
    if (msg == null && acao == 1) {
      imprimirMsg(msgs: "Digite  um(a) $elemento para música ou 'Menu': ");
    } else if (msg != null) {
      imprimirMsg(msgs: msg);
    } else if (msg == null && acao == 2) {
      imprimirMsg(
          msgs:
              "Atualize o(a) $elemento da música ou deixe vazio e dê 'Enter': ");
      //Para funcionar o Enter
      dado = stdin.readLineSync(encoding: utf8)!;
      return dado.trim();
    }
    dado = stdin.readLineSync(encoding: utf8)!;
  } while (dado == "");

  return dado.trim();
}

//Crédito:https://api.dart.dev/stable/2.14.4/dart-core/num/tryParse.html
//FUNÇÃO - Verifica se é um numero inteiro
//Retorna "null" caso não seja um número inteiro
num? verificarNumero(String valor) {
  String source = valor.trim();
  return int.tryParse(source);
}

//FUNÇÃO - Imprime mensagens
imprimirMsg({required String msgs}) {
  String msg = msgs;
  return print("\n$msg");
}

//FUNÇÃO - Adiciona o música alista
//Nome
//Duracao
//Autor
//Cantor
//Album
//Nacionalidade
//Ano de lancamento
List<String> propriedadesMusica({bool imprime = false}) {
  if (imprime) {
    List<String> propriedadesImprime = <String>[
      'Nome',
      'Duração',
      'Autor',
      'Cantor',
      'Álbum',
      'Nacionalidade',
      'Ano de Lançamento'
    ];
    return propriedadesImprime;
  } else {
    List<String> propriedadesMap = <String>[
      'nome',
      'duaracao',
      'autor',
      'cantor',
      'album',
      'nacionalidade',
      'anoLancamento'
    ];
    return propriedadesMap;
  }
  return [];
}

String adicionarMusica() {
  List<String> propriedades = propriedadesMusica();
  Map<String, dynamic> temp = {};

  imprimirMsg(msgs: "Insira informações sobre a música:");
  for (var element in propriedades) {
    //Ação 1 descrição para inserir um novo Map
    String propriedade = inserirValorTeclado(elemento: element, acao: 1);
    if (propriedade.toLowerCase() == "menu") {
      return "menu";
    }
    temp[element] = propriedade;
  }
  Map<String, dynamic> musica = temp;
  minhasMusicas.add(musica);
  imprimirMsg(
      msgs: 'Música "${musica.values.elementAt(0)}" adicinada a lista!');
  listarItensLista();

  return "";
}

//FUNÇÃO - Lista itens na lista
void listarItensLista({bool dalay = true}) {
  imprimirMsg(msgs: 'Lista de músicas:');

  if (minhasMusicas.isEmpty) {
    imprimirMsg(msgs: "LISTA VAZIA!");
  } else {
    for (var i = 0; i < minhasMusicas.length; i++) {
      List<String> propriedades = propriedadesMusica(imprime: true);
      imprimirMsg(msgs: 'POSIÇÃO [${i + 1}]');
      for (var j = 0; j < propriedades.length; j++) {
        imprimirMsg(
            msgs:
                "${propriedades[j]}=> ${minhasMusicas[i].values.elementAt(j)}");
      }
    }
  }
  imprimirMsg(msgs: "======================================================");
  dalayAcao(ativo: dalay);
}

//FUNÇÃO - remove o item e retorna em "String" o item removido
String removerItem() {
  listarItensLista();
  String posicao =
      inserirValorTeclado(msg: 'Insira uma posição a ser removida ou "Menu":');

  if (posicao.toLowerCase() == "menu") {
    return "menu";
  }
  int posicaoRefat = int.parse(posicao) - 1;

  if (minhasMusicas.length > posicaoRefat && posicaoRefat >= 0) {
    minhasMusicas.removeAt(posicaoRefat);
    imprimirMsg(msgs: "Posição número $posicao removida!");
    listarItensLista();
  } else {
    imprimirMsg(msgs: "Posição número $posicao não consta na lista!");
    listarItensLista();
  }

  return "";
}

//FUNÇÃO - atualiza o item e retorna em "String" o item atualizado
//Para fins didáticos usei INSERT
//Mas pode ser usaldo assim: lista[posição]
String atualizarItem() {
  listarItensLista(dalay: false);
  String posicao =
      inserirValorTeclado(msg: 'Digite a posição a ser atualizada ou "Menu":');
  if (posicao.toLowerCase() == "menu") {
    return "menu";
  }
  int posicaoRefat = int.parse(posicao) - 1;
  if (minhasMusicas.length > posicaoRefat && posicaoRefat >= 0) {
    atualizarPosicao(posicao: posicaoRefat);
    imprimirMsg(msgs: "Posição número $posicao atualizada!");
    listarItensLista(dalay: false);
  } else {
    imprimirMsg(msgs: "Posição número $posicao não consta na lista!");
    listarItensLista(dalay: false);
  }
  return "";
}

String atualizarPosicao({required int posicao}) {
  List<String> propriedades = propriedadesMusica();

  imprimirMsg(msgs: "Atualize as informações da música:");
  for (var element in propriedades) {
    //Ação 2 descrição para atualizar um Map
    String propriedade = inserirValorTeclado(elemento: element, acao: 2);
    bool teste = (propriedade != "") ? true : false;
    if (propriedade.toLowerCase() == "menu") {
      return "menu";
    }
    if (teste) {
      minhasMusicas[posicao].update(element, (value) => "'$propriedade'");
    } else {
      imprimirMsg(msgs: '"$element" não foi atualizado');
    }
  }
  imprimirMsg(msgs: "Posição $posicao atualizado!");
  imprimirMsg(msgs: "======================================================");
  return "";
}

bool listaReordenada() {
  imprimirMsg(msgs: 'Lista antes de ser reordenada: ');
  listarItensLista(dalay: false);
  //Verifica a quantidade de itens na lista
  if (minhasMusicas.length < 2) {
    dalayAcao(
        ativo: true,
        duracaoSeg: 3,
        msg: 'Quantidade de valores na lista não atende a reordenação! ');
    return false;
  }
  minhasMusicas.shuffle();
  imprimirMsg(msgs: 'Lista após de ser reordenada: ');
  listarItensLista();
  return true;
}

/* void ordenar({required String tipo}) {
  if (tipo == "1") {
    minhasMusicas.sort((a, b) => a.compareTo(b));
  } else if (tipo == "2") {
    minhasMusicas.sort((a, b) => b.compareTo(a));
  } else {
    imprimirMsg(msgs: "Função $tipo não definida");
    sairPara(situacao: "menu");
  }
} */

void dalayAcao({bool ativo = false, duracaoSeg = 5, String msg = ""}) {
  String mensagens = (msg == "") ? "\nAguarde, o menu logo aparecerá" : msg;
  if (ativo) {
    stdout.write(mensagens);
    for (var i = 0; i < duracaoSeg; i++) {
      sleep(Duration(seconds: 1));
      stdout.write(".");
    }
  }
}
