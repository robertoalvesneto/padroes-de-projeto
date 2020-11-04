class Casa {
  List _quartos = [];

  Casa();

  void adicionarQuarto(Quarto quarto) {
    this._quartos.add(quarto);
  }

  set quartos(List quartos) {
    this._quartos += quartos;
  }

  List get quartos {
    return this._quartos;
  }
}

class Quarto {
  int _id;
  Parede _paredeEsq;
  Parede _paredeDir;
  Parede _paredeFrente;
  Parede _paredeAtras;
  Porta _porta;

  Quarto(this._id, this._paredeEsq, this._paredeDir, this._paredeFrente,
      this._paredeAtras);

  void adicionarPorta(Porta porta) {
    this._porta = porta;
  }

  int get id {
    return this._id;
  }

  Parede get paredeEsquerda {
    return this._paredeEsq;
  }

  Parede get paredeDireita {
    return this._paredeDir;
  }

  Parede get ParedeFrente {
    return this._paredeFrente;
  }

  Parede get paredeAtras {
    return this._paredeAtras;
  }

  Porta get porta {
    return this._porta;
  }
}

class Parede {
  String _cor;

  Parede(this._cor);

  String get cor {
    return this._cor;
  }
}

class Porta {
  Quarto _quartoAtual;
  Quarto _quartoDestino;

  Porta(this._quartoAtual, this._quartoDestino);

  Quarto get quartoAtual {
    return this._quartoAtual;
  }

  Quarto get quartoDestino {
    return this._quartoDestino;
  }
}

abstract class CasaFactory {
  Casa criarCasa();
  Quarto criarQuarto(int id, Parede p1, Parede p2, Parede p3, Parede p4);
  Parede criarParede(String cor);
  Porta criarPorta(Quarto quarto1, Quarto quarto2);
}

class PlantaCasa extends CasaFactory {
  @override
  Casa criarCasa() {
    return Casa();
  }

  @override
  Parede criarParede(String cor) {
    return Parede(cor);
  }

  @override
  Porta criarPorta(Quarto quarto1, Quarto quarto2) {
    return Porta(quarto1, quarto2);
  }

  @override
  Quarto criarQuarto(int id, Parede p1, Parede p2, Parede p3, Parede p4) {
    return Quarto(id, p1, p2, p3, p4);
  }
}

Casa construirCasa(CasaFactory factory) {
  Casa casa = Casa();

  int id = 1;
  Parede parede1 = factory.criarParede("branca");
  Parede parede2 = factory.criarParede("branca");
  Parede parede3 = factory.criarParede("branca");
  Parede parede4 = factory.criarParede("azul");

  final quarto1 = factory.criarQuarto(id, parede1, parede2, parede3, parede4);

  id = 2;
  parede1 = factory.criarParede("cinza");
  parede2 = factory.criarParede("cinza");
  parede3 = factory.criarParede("preto");
  parede4 = factory.criarParede("preto");

  final quarto2 = factory.criarQuarto(id, parede1, parede2, parede3, parede4);

  casa.adicionarQuarto(quarto1);
  casa.adicionarQuarto(quarto2);

  return casa;
}

void main() {
  final factory = PlantaCasa();

  final casa = construirCasa(factory);

  print(casa.quartos[1].paredeEsquerda.cor);
}
