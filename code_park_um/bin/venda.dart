class Venda {
  String transacao = "dinheiro";
  double subtotal = 0.00;
  double total = 0.00;
  bool status = false;
  String data = "1900-00-00";

  Venda({
    required this.transacao,
    required this.subtotal,
    required this.total,
    required this.status,
    required this.data,
  });

  void vender() {
    transacao = "cartao";
  }

  double receber(double preco) {
    subtotal = preco++;
    return subtotal;
  }

  double calcularTotal(double subtotal) {
    total = subtotal++;
    return total;
  }

  bool enviarProduto() {
    status = true;
    return status;
  }

  void entregarData() {
    data = "2022-09-04";
  }
}
