// ignore_for_file: public_member_api_docs, sort_constructors_first
class Balconista {
  String nome;
  String? _senha;
  int? _nivelAcesso;
  String mensagem = "";

  Balconista({
    required this.nome,
  });

  void setSenha(String senha) {
    if (senha.length >= 6) {
      _senha = senha;
      mensagem += "Senha definida!\n";
    } else {
      mensagem += "Mínimo de seis caracteres!\n";
    }
  }

  void setNivel(int nivel) {
    if (nivel > 0 && nivel <= 5) {
      _nivelAcesso = nivel;
      mensagem += "Acesso defindo! Nível:$nivel!\n";
    } else {
      mensagem += "Acesso a segura tem qye ser definido entre 1 e 5!\n";
    }
  }

  String? getSenha() {
    return _senha;
  }

  int? getnivel() {
    return _nivelAcesso;
  }

  @override
  String toString() {
    return 'Balconista:\n nome: $nome,\n mensagem:\n $mensagem';
  }
}
