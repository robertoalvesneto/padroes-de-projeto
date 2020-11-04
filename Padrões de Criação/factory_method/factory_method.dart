class Quarto {
  int _id;
  List<Parede> _paredes;

  Quarto(this._id, this._paredes);

  int get id {
    return this._id;
  }

  List<Parede> get paredes {
    return this._paredes;
  }
}

class Parede {
  String _cor;

  Parede(this._cor);

  String get cor {
    return this._cor;
  }
}

//Primeira forma: uma Factory Method que decide, segundo o parametro passado,
//qual a forma de construção da casa.
abstract class AbstractQuartoFactory {
  Quarto criarQuarto(String tipoQuarto);
}

class QuartoFactory extends AbstractQuartoFactory {
  @override
  Quarto criarQuarto(String tipoQuarto) {
    if (tipoQuarto == 'quadrado') {
      return _quartoQuadrado();
    } else if (tipoQuarto == 'hexagonal') {
      return _quartoHexagonal();
    }

    return Quarto(0, []);
  }

  Quarto _quartoQuadrado() {
    final parede1 = _criarParede('branca');
    final parede2 = _criarParede('branca');
    final parede3 = _criarParede('branca');
    final parede4 = _criarParede('cinza');
    final paredes = [parede1, parede2, parede3, parede4];

    //nota: esse id n poderia ser sempre igual
    return Quarto(1, paredes);
  }

  Quarto _quartoHexagonal() {
    final parede1 = _criarParede('branca');
    final parede2 = _criarParede('branca');
    final parede3 = _criarParede('branca');
    final parede4 = _criarParede('branca');
    final parede5 = _criarParede('azul');
    final parede6 = _criarParede('azul');
    final paredes = [parede1, parede2, parede3, parede4, parede5, parede6];

    //nota: esse id n poderia ser sempre igual
    return Quarto(1, paredes);
  }

  Parede _criarParede(String cor) {
    return Parede(cor);
  }
}

//Segunda forma: duas Factory Method s diferentes, onde cada uma implementa sua
//forma de criação e o usuário decide qual vai usar.
abstract class AbstractQuartoFactory2 {
  Quarto criarQuarto();
}

class QuartoQuadradoFactory extends AbstractQuartoFactory2 {
  @override
  Quarto criarQuarto() {
    final parede1 = _criarParede('branca');
    final parede2 = _criarParede('branca');
    final parede3 = _criarParede('branca');
    final parede4 = _criarParede('cinza');
    final paredes = [parede1, parede2, parede3, parede4];

    //nota: esse id n poderia ser sempre igual
    return Quarto(1, paredes);
  }

  Parede _criarParede(String cor) {
    return Parede(cor);
  }
}

class QuartoHexagonalFactory extends AbstractQuartoFactory2 {
  @override
  Quarto criarQuarto() {
    final parede1 = _criarParede('branca');
    final parede2 = _criarParede('branca');
    final parede3 = _criarParede('branca');
    final parede4 = _criarParede('branca');
    final parede5 = _criarParede('azul');
    final parede6 = _criarParede('azul');
    final paredes = [parede1, parede2, parede3, parede4, parede5, parede6];

    //nota: esse id n poderia ser sempre igual
    return Quarto(1, paredes);
  }

  Parede _criarParede(String cor) {
    return Parede(cor);
  }
}

void main() {
  //Primeira forma.
  AbstractQuartoFactory quartoFactory = QuartoFactory();
  final quarto = quartoFactory.criarQuarto('quadrado');

  print('Parede do quarto 1: ' + quarto.paredes[3].cor);

  //Segunda forma.
  AbstractQuartoFactory2 quartoFactory2 = QuartoHexagonalFactory();
  final quarto2 = quartoFactory2.criarQuarto();
  print('Parede do quarto 2: ' + quarto2.paredes[5].cor);
}
