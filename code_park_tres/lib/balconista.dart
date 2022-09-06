import 'dart:io';

class Balconista {
  String nome;
  String? _senha;
  int? _nivelAcesso;
  String mensagem = "";

  Balconista({
    required this.nome,
  });

  set setNome(String nome) => this.nome = nome;
  String get getNome => nome;

  void setSenha(String senha) {
    bool teste = true;
    while (teste) {
      if (senha.length >= 6) {
        _senha = senha;
        mensagem += "Senha definida!\n";
        teste = false;
      } else {
        print("Erro: Mínimo de seis caracteres!");
        print("Digite uma senha maior ou igual a 6 caracteres:");
        senha = stdin.readLineSync().toString();
      }
    }
  }

  get senha => _senha;

  void setNivel(int nivel) {
    bool teste = true;
    while (teste) {
      if (nivel > 0 && nivel <= 5) {
        _nivelAcesso = nivel;
        mensagem += "Acesso defindo! Nível:$nivel.\n";
        teste = false;
      } else {
        print("Erro: Nível de acesso incorreto!");
        print("Digite o nível de acesso entre 1 e 5:");
        nivel = int.parse(stdin.readLineSync().toString());
      }
    }
  }

  get nivelAcesso => _nivelAcesso;

  set setMensagem(mensagem) => this.mensagem = mensagem;
  get getMensagem => mensagem;

  @override
  String toString() {
    //print("\x1B[2J\x1B[0;0H");
    return 'Balconista:\n nome: $nome,\n mensagem:\n $mensagem';
  }
}
