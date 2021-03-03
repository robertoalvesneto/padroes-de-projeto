//Widget geral que serve de base para a coluna poder conter qualquer elemento
abstract class Widget {
  desenharForma();
}

class Coluna {
  List<Widget> lista;

  Coluna({this.lista}) : assert(lista != null && lista != []) {
    for (Widget item in lista) {
      item.desenharForma();
      print("\n_____\n");
    }
  }
}

//_____________FORMAS
abstract class Forma extends Widget {
  int altura;
  int largura;
  Desenhar desenho;
  Preenchimento preenchimento;

  Forma({
    this.altura,
    this.largura,
    this.desenho,
    preenchimento,
  }) : this.preenchimento =
            (preenchimento == null) ? Preenchimento.completo : preenchimento;

  @override
  desenharForma();
}

class Quadrado extends Forma {
  Quadrado({
    int largura,
    Desenhar desenho,
    Preenchimento preenchimento,
  })  : assert(largura != null),
        assert(desenho != null),
        super(
          largura: largura,
          altura: largura,
          desenho: desenho,
          preenchimento: preenchimento,
        );

  @override
  desenharForma() {
    print("DESENHANDO UM QUADRADO");
    desenho.desenhar(largura, altura, preenchimento);
  }
}

class Retangulo extends Forma {
  Retangulo(
      {int altura, int largura, Desenhar desenho, Preenchimento preenchimento})
      : assert(altura != null),
        assert(largura != null),
        assert(desenho != null),
        assert(altura != largura),
        super(
          largura: largura,
          altura: altura,
          desenho: desenho,
          preenchimento: preenchimento,
        );

  @override
  desenharForma() {
    print("DESENHANDO UM RETANGULO\n");
    desenho.desenhar(largura, altura, preenchimento);
  }
}

//_____________COMO DESENHAR AS FORMAS
abstract class Desenhar {
  desenhar(int largura, int altura, Preenchimento preenchimento);
}

class DesenharMatriz implements Desenhar {
  @override
  desenhar(int largura, int altura, Preenchimento preenchimento) {
    print('COM A CLASSE DE DESENHAR MATRIZ');
    for (int i = 0; i < altura; i++) {
      String text = ' ';
      for (int j = 0; j < largura; j++)
        text += '[$i${preenchimento.valor}$j]  ';
      print(text);
    }
  }
}

class DesenharSolido implements Desenhar {
  @override
  desenhar(int largura, int altura, Preenchimento preenchimento) {
    print('COM A CLASSE DE DESENHAR SOLIDO');
    print(((preenchimento.valor * 2 * largura) + '\n') * altura);
  }
}

//_____________PREENCHIMENTO DO DESENHO DAS FORMAS
class Preenchimento {
  String _p;

  Preenchimento(this._p);

  get valor => this._p;

  static final Preenchimento vazio = Preenchimento('▢');
  static final Preenchimento parcial = Preenchimento('░');
  static final Preenchimento completo = Preenchimento('█');
  static final Preenchimento diamente = Preenchimento('◆');
}

void main() {
  Coluna(
    lista: [
      Quadrado(
        largura: 4,
        desenho: DesenharMatriz(),
      ),
      Quadrado(
        largura: 5,
        desenho: DesenharSolido(),
        preenchimento: Preenchimento.diamente,
      ),
      Retangulo(
        altura: 4,
        largura: 9,
        desenho: DesenharSolido(),
      ),
      Retangulo(
        altura: 4,
        largura: 8,
        desenho: DesenharSolido(),
        preenchimento: Preenchimento.parcial,
      ),
    ],
  );
}
