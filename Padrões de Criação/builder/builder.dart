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

  set porta(Porta porta) {
    this._porta = porta;
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

abstract class CasaBuilder {
  criarQuarto(int id);
  criarPorta(int quarto1, int quarto2);
  Casa get casa;
}

class PlantaCasa extends CasaBuilder {
  Casa _casa = Casa();

  PlantaCasa() {
    criarQuarto(1);
    criarQuarto(2);
    criarPorta(1, 2);
  }

  Parede _criarParede(cor) {
    return Parede(cor);
  }

  @override
  criarPorta(int quarto1, int quarto2) {
    Quarto quartoAtual;
    Quarto quartoDestino;

    int idQuartoAtual;
    int idQuartoDestino;

    for (int i = 0; i < this._casa.quartos.length; i++) {
      if (this._casa.quartos[i].id == quarto1) {
        quartoAtual = this._casa.quartos[i];
        idQuartoAtual = i;
      }
      if (this._casa.quartos[i].id == quarto2) {
        quartoDestino = this._casa.quartos[i];
        idQuartoDestino = i;
      }
    }

    this._casa.quartos[idQuartoAtual].porta = Porta(quartoAtual, quartoDestino);
    this._casa.quartos[idQuartoDestino].porta =
        Porta(quartoDestino, quartoAtual);
  }

  @override
  criarQuarto(int id) {
    final parede1 = this._criarParede("branca");
    final parede2 = this._criarParede("branca");
    final parede3 = this._criarParede("branca");
    final parede4 = this._criarParede("azul");

    final quarto = Quarto(id, parede1, parede2, parede3, parede4);

    this._casa.quartos.add(quarto);
  }

  @override
  Casa get casa {
    return this._casa;
  }
}

void main() {
  final planta = PlantaCasa();

  final casa = planta.casa;

  print(casa.quartos[1].paredeEsquerda.cor);
}
