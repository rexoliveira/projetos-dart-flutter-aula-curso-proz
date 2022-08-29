import 'dart:convert';
import 'dart:io';

//Para fins didáticos quase todas as linhas foram comentadas*
//Nome de funções em portugues*
//Código inativo para busca de solução*
//*NÃO É BOA PRÁTICA

// Variaveis GLOBAIS(List do tipo String, Map Chave String e Valor Dynamic,
// Variável do tipo num).
// Uma das opções a serem exploradas na construção simples de uma aplicação
// em terminal
List<String> menu = <String>[];
final minhasMusicas = <Map<String, dynamic>>[];
//num-aceita double e int negativo/positivo desde que seja um número
num? entraValor;

//Metodo MAIN inicia a aplicação
void main(List<String> arguments) {
  //Limpa o terminal
  print("\x1B[2J\x1B[0;0H");
  do {
    //Chama o menu de opções
    chamarListaMenu();

    //Define as funções conforme opção do Menu
    switch (entraValor) {

      //SAI da aplicação
      case 0:
        sairPara(situacao: entraValor.toString());
        break;

      //ADICIONA música a lista
      case 1:
        String msg = adicionarMusica();
        if (sairPara(situacao: msg)) {
          break;
        }
        break;

      //REMOVE o música da lista mas antes remove o música
      case 2:
        String msg = removerItem();
        if (sairPara(situacao: msg)) {
          break;
        }
        break;

      //ATUALIZA lista
      case 3:
        String msg = atualizarItem();
        if (sairPara(situacao: msg)) {
          break;
        }
        break;

      //REORDENA a lista
      case 4:
        listaReordenada();
        break;
      //LISTAR conteudo da lista
      case 5:
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
        sairPara(situacao: "Menu");
    }
  } while (entraValor != 0);
}

//##############################-FUNÇÕES-#######################################

//FUNÇÃO - Menu de opções
void chamarListaMenu() {
  //Lista de opções do MENU
  menu = [
    "Sair da aplicação",
    "Adicionar música",
    "Remover música",
    "Atualizar música",
    "Reordenar lista",
    "Ordenar como?",
    "Mostrar lista",
  ];

  //Imprime lista de itens do MENU
  for (var i = 1; i < menu.length; i++) {
    imprimirMsg(msgs: "$i) ${menu[i]}");
  }
  //Imprime por ultimo item "Sair do APP"
  imprimirMsg(msgs: "0) ${menu[0]}");
  //Emtrada do teclado do item escolhido
  entraValor = verificarNumero(
      inserirValorTeclado(msg: "Escolha uma das opções acima*:", acao: 1));
  //Caso não digitar números

  entraValor = entrarDadoMenu(entrada: entraValor);
  //Verifica se a lista está vazia
  entraValor = verificarLista(entrada: entraValor);
  //Separador apresentando a escolha
  imprimirMsg(
      msgs:
          "======================${menu[int.parse(entraValor.toString())]}======================");
}

//FUNÇÃO - Verifica se é um número e se esta entre 0 e 5
entrarDadoMenu({required var entrada, int posicao = -1}) {
  while (entrada == null || !(entrada >= 0 && entrada <= menu.length - 1)) {
    if (posicao == -1) {
      imprimirMsg(
          msgs:
              "(*Escolha somente números inteiros entre 0 e ${menu.length - 1}!)");
    } else {
      if (posicao > 1) {
        imprimirMsg(
            msgs: "(*Escolha somente números inteiros entre 1 e $posicao!)");
      } else {
        imprimirMsg(
            msgs:
                "*Escolha somente números inteiros, e há somente uma posição a ser removida!");
      }
    }
    entrada = verificarNumero(inserirValorTeclado());
  }
  return entrada;
}

//FUNÇÃO - Verifica se a lista está vazia, se for vazia e o usuário escolher
//a opção que não seja a 1, entrará direto nessa opção.
//Impedido manipular lista vazia
verificarLista({required var entrada}) {
  if (minhasMusicas.isEmpty && entrada != 1 && entrada != 0) {
    imprimirMsg(msgs: "Lista vazia!");
    return entrada = 1;
  }
  return entrada;
}

//FUNÇÃO - Voltar ao menu ou sai da aplicação
//exit(0) - Fonte:https://api.dart.dev/stable/2.18.0/dart-io/exit.html
bool sairPara({required String situacao}) {
  //Retorna ao MENU
  if (situacao.toLowerCase() == "menu") {
    imprimirMsg(msgs: "Retornou ao Menu!");
    return true;
    //Sai da Aplicação
  } else if (situacao == "0") {
    imprimirMsg(msgs: "Saiu da aplicação!");
    //Função nativa/Dart para sair da aplicativo
    exit(0);
  }
  return false;
}

//FUNÇÃO - Entrada de valores tipo "String" pelo teclado/terminal
//Retorna valor inserido na entraga do teclado/terminal String
//Mensagem - 1-Insere no Map e 2-Atualiza elementos no Map
String inserirValorTeclado({String? msg, int? acao}) {
  String entrada = "";
  //Para continuar no laço
  bool teste = true;

  //Repete até que há uma entrada pelo teclado/terminal
  //que satisfaça um requisito;
  //msg-Para diminuir a quantidade de códigos pode ser inserida uma mensagem
  do {
    //Entrada pelo teclado/terminal genérico
    if (msg != null && msg.trim().isNotEmpty && acao != 2) {
      imprimirMsg(msgs: msg);
      //2-Entrada para atualizar uma música na lista
    } else if (acao == 2) {
      imprimirMsg(msgs: msg!);
      //Para funcionar o ENTER com entrada VAZIA, caso seja uma atualização
      //de uma ou mais propriedades da música no MAP
      entrada = stdin.readLineSync(encoding: utf8)!;
      return entrada.trim();
    }
    //Entrada teclado/terminal que não seja uma atualização
    entrada = stdin.readLineSync(encoding: utf8)!;
    //Se não for vazio ele
    if (entrada.trim().isNotEmpty) {
      //Retorna das entradas teclado/terminal que esteja vazia
      return entrada.trim();
    } else {
      //Caso a entrada seja vazia, persiste um alerta até uma ação válida
      imprimirMsg(msgs: "*Insira dados válidos ou saia para o Menu");
    }
  } while (teste);
}

//FUNÇÃO - Verifica se é um numero inteiro
//Retorna "null" caso não seja um número inteiro
//Crédito:https://api.dart.dev/stable/2.14.4/dart-core/num/tryParse.html
num? verificarNumero(String valor) {
  String fonte = valor.trim();
  //Caso a entrada seja inválida, o programa retornará null.
  //Esta é a diferença entre tryParse() e
  //parse()(que lança exceção se não manipularmos o método onError).
  return int.tryParse(fonte);
}

//FUNÇÃO - Imprime mensagens
//Foi criado uma função para ampliar as possibilidades de impressão
imprimirMsg({required String msgs}) {
  String msg = msgs;
  return print("\n$msg");
}

//FUNÇÃO - Lista de propropriedades da Musica tanto para adicionar em um Map
//quanto para ser impresso na tela
List<String> propriedadesMusica({bool imprime = false}) {
  if (imprime) {
    //Propriedades para impressão na tela
    List<String> propriedadesImprime = <String>[
      'Nome',
      'Duração',
      'Autor',
      'Cantor',
      'Álbum',
      'Nacionalidade',
      'Ano de Lançamento'
    ];
    //Retorna a uma List de Strings para construção de CHAVES de um Map
    return propriedadesImprime;
  } else {
    //Propriedades para inserção como CHAVE em Map
    List<String> propriedadesMap = <String>[
      'nome',
      'duaracao',
      'autor',
      'cantor',
      'album',
      'nacionalidade',
      'anoLancamento'
    ];
    //Retorna a uma List de Strings para construção de CHAVES para impressão
    return propriedadesMap;
  }
}

//FUNÇÃO - Adiciona o música a LISTA
String adicionarMusica() {
  //Por padrão é false, pripriedades para CHAVEs de um Map
  List<String> propriedades = propriedadesMusica();
  //imprime=true - propriedades para impressão
  List<String> propriedadesImpressao = propriedadesMusica(imprime: true);
  //Map para músicas
  Map<String, dynamic> musica = {};
  imprimirMsg(msgs: "Insira informações sobre a música:");

  // ignore: unused_local_variable
  int prop = 0;
  //Seleciona uma propriedade dentro da lista de propriedades para Map
  for (var element in propriedades) {
    //Mensagem para inserir um novo valor no Map conforme element/propriedade
    String entrada = inserirValorTeclado(
        msg:
            "Digite  um(a) ${propriedadesImpressao[prop].toLowerCase()} para música ou 'Menu': ",
        acao: 1);
    prop++;
    //Caso queira cancelar a inserção e ir para o MENU
    if (entrada.toLowerCase() == "menu") {
      return "menu";
    }
    //Adiciona no Map "musica"
    musica[element] = entrada;
  }
  //Adiciona o Map "musica" na lista de Maps "minhasMusicas"
  minhasMusicas.add(musica);
  //Imprime no terminal o "nome" da música adicionada
  imprimirMsg(
      msgs: 'Música "${musica.values.elementAt(0)}" adicinada a lista!');
  //Imprime na Tela todas as músicas na lista "minhasMusicas"
  listarItensLista();
  //Faz um retorno vazio caso a música seja adicionada
  return "";
}

//FUNÇÃO - Imprime lista formatada de músicas no terminal
void listarItensLista({bool dalay = true}) {
  //Mostra o título da impressão a quantidade de músicas na lista
  imprimirMsg(msgs: 'Lista de músicas (quantitade = ${minhasMusicas.length}):');
  //Caso a lista seja vazia
  if (minhasMusicas.isEmpty) {
    imprimirMsg(msgs: "LISTA VAZIA!");
  } else {
    //Não sendo vazia imprime com as "propriedades/chave"  para impressão;
    //"i" posição dentro da LISTA e "j" posição dentro do MAP em
    //"minhasMusicas = <Map<String, dynamic>>[]"
    for (var i = 0; i < minhasMusicas.length; i++) {
      //Escolhe as "propriedades/chave"  para impressão
      List<String> propriedades = propriedadesMusica(imprime: true);
      //Imprime qual a posição
      imprimirMsg(msgs: 'POSIÇÃO [${i + 1}]');
      //Faz um "for" conforme quantiade de propriedades/chave
      for (var j = 0; j < propriedades.length; j++) {
        //Imprime as propriedades/chaves e valores formatados no terminal
        imprimirMsg(
            msgs:
                "${propriedades[j]} => ${minhasMusicas[i].values.elementAt(j)}");
      }
    }
  }
  //*As duas linhas abaixo são irrelavantes para funcionamento
  imprimirMsg(msgs: "======================================================");
  //Ajuda visualisar a lista antes de aparecer o MENU
  dalayAcao(ativo: dalay);
}

//FUNÇÃO - remove o item e retorna em "String" o item removido
String removerItem() {
  //Imprime no terminal todas as músicas na lista "minhasMusicas, para escolha
  //da música a ser removida
  listarItensLista();
  String posicao =
      inserirValorTeclado(msg: 'Insira uma posição a ser removida ou "Menu":');

  if (posicao.toLowerCase() == "menu") {
    return "menu";
  } else if (posicao.toLowerCase() != "menu" &&
      verificarNumero(posicao) == null) {
    //Caso não digitar números e nem Menu - Entra a quantidade de posições
    posicao =
        entrarDadoMenu(entrada: null, posicao: minhasMusicas.length).toString();
  }
  //Transforma a posição em um inteiro menos 1
  int posicaoRefat = int.parse(posicao) - 1;
  //Verifica se quantidade de posições na lista atende o que foi digitado na entrada
  if (minhasMusicas.length > posicaoRefat && posicaoRefat >= 0) {
    //Remove a posição digitada
    minhasMusicas.removeAt(posicaoRefat);
    //Imprime no terminal a posição digitada
    imprimirMsg(msgs: "Posição $posicao removida!");
    //Lista os itens da lista restantes ou avisa caso a lista esteja vazia
    listarItensLista();
  } else {
    //Lista os itens da lista restantes ou avisa caso a lista esteja vazia
    listarItensLista();
    //Caso o que foi digitado na entrada não atender o que há na lista
    imprimirMsg(msgs: "Posição $posicao a ser removida, não consta na lista!");
  }

  return "";
}

//FUNÇÃO - atualiza o item e retorna "String" do item atualizado
String atualizarItem() {
  //Imprime noterminal a lista sem dalay de visualização
  imprimirMsg(msgs: "Lista antes da atualização");
  listarItensLista(dalay: false);

  String posicao =
      inserirValorTeclado(msg: 'Digite a posição a ser atualizada ou "Menu":');
  if (posicao.toLowerCase() == "menu") {
    return "menu";
  } else if (posicao.toLowerCase() != "menu" &&
      verificarNumero(posicao) == null) {
    //Caso não digitar números e nem Menu - Entra a quantidade de posições
    posicao =
        entrarDadoMenu(entrada: null, posicao: minhasMusicas.length).toString();
  }
  //Transforma em inteiro menos 1
  int posicaoRefat = int.parse(posicao) - 1;
  //Verifica se atende a quantidade de posições na lista
  if (minhasMusicas.length > posicaoRefat && posicaoRefat >= 0) {
    //Chama a FUNÇÃO atualizar o Map "musica"
    atualizarPosicao(posicao: posicaoRefat);
  } else {
    listarItensLista(dalay: false);
    imprimirMsg(
        msgs: "Posição $posicao a ser atualizada, não consta na lista!");
  }
  return "";
}

//FUNÇÃO - Atualiza itens do Map "musica" que está na lista "minhasMusicas"
void atualizarPosicao({required int posicao}) {
  //Lista de propriedades/chave para alteração do Map
  List<String> propriedades = propriedadesMusica();
  //imprime=true - propriedades para impressão
  List<String> propriedadesImpressao = propriedadesMusica(imprime: true);

  // ignore: unused_local_variable
  int prop = 0;
  String elementoImp = "";
  imprimirMsg(
      msgs:
          'Atualize as informações da música "${minhasMusicas[posicao].values.elementAt(0)}":');
  //Percorre as propriedades/chave a serem atualizadas
  for (var element in propriedades) {
    //Variável que recebe as propriedades a serem impressas
    elementoImp = propriedadesImpressao[prop].toLowerCase();
    //Ação 2 descrição para atualizar um Map
    String entrada = inserirValorTeclado(
        msg:
            "Atualize o(a) $elementoImp da música ou deixe vazio e dê 'Enter': ",
        acao: 2);
    prop++;
    //Se a entrada for diferente de vazia atualiza a CHAVE especifica
    if (entrada != "") {
      minhasMusicas[posicao].update(element, (value) => "'$entrada'");
    } else {
      //Caso não informa qual CHAVE não foi atualizada
      imprimirMsg(msgs: '"$elementoImp" não foi atualizado');
    }
  }
  //Informações sobre a lista após ser atualizada ou não
  imprimirMsg(msgs: "Posição ${posicao + 1} atualizada!");
  imprimirMsg(msgs: "Lista após a atualização");
  listarItensLista(dalay: false);
}

//FUNÇÃO - Embaralha os Maps da lista
void listaReordenada() {
  imprimirMsg(msgs: 'Lista antes de ser reordenada: ');
  listarItensLista(dalay: false);
  //Verifica quantidade de Maps da lista, respeitando o mínimo de 2 itens
  if (minhasMusicas.length < 2) {
    dalayAcao(
        ativo: true,
        duracaoSeg: 3,
        msg: 'Tem que ter duas ou mais músicas para serem reordenadas! ');
  } else {
    //Tendo mais de uma músicas a lista é embaralhada
    minhasMusicas.shuffle();
    imprimirMsg(msgs: 'Lista após de ser reordenada: ');
    listarItensLista();
  }
}

//FUNÇÃO - não encontrada solução para essa função
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

//FUNÇÃO - não necessária para funcionamento da aplicação/terminal
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
