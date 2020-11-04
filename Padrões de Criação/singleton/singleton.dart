class BancoDados {
  List<dynamic> conteudo = [];

  //Guarda sua instância.
  static BancoDados _instancia = null;

  //Método construtor privado.
  BancoDados._privado();

  //Singleton: se a variável ainda não foi inicializada, inicializa.
  //Retorna a instância única.
  static BancoDados singleton() {
    if (_instancia == null) _instancia = BancoDados._privado();

    return _instancia;
  }

  int inserir(dynamic valor) {
    this.conteudo.add(valor);

    return 1;
  }

  int atualizar(dynamic atual, dynamic valor) {
    for (int i; i < this.conteudo.length; i++) {
      if (this.conteudo[i] = atual) {
        this.conteudo[i] = valor;
        return 1;
      }
    }
    return 0;
  }

  void exibir() {
    print(conteudo);
  }

  int remover(dynamic remover) {
    for (int i; i < this.conteudo.length; i++) {
      if (this.conteudo[i] = remover) {
        this.conteudo.remove(remover);
        return 1;
      }
    }
    return 0;
  }
}

void main() {
  BancoDados banco = BancoDados.singleton();

  banco.inserir(['João', 21]);
  banco.inserir(['Roberto', 20]);
  banco.inserir(['Carlos', 12]);

  BancoDados banco2 = BancoDados.singleton();

  banco.inserir(['Joana', 19]);

  banco.exibir();
  banco2.exibir();

  print(banco == banco2);
}
