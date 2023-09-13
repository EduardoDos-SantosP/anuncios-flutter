class Anuncio {
  late String nome;
  late String descricao;
  late double preco;

  Anuncio(this.nome, this.preco, String? descricao) {
    this.descricao = descricao ?? '';
  }
}
