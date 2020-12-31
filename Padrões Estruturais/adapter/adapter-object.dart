//CLASSE DE EXIBIÇÃO
class Exibir {
  void nome(Map pessoa) => print(pessoa['nomecompleto']);
}

//ADAPTER POR COMPOSIÇÃO DE OBJETOS
abstract class Target {
  request(Map pessoa);
}

class Adapter extends Target {
  @override
  request(Map pessoa) {
    final Map pessoaAdaptada = {
      'nomecompleto': pessoa['nome'] + ' ' + pessoa['sobrenome'],
      'idade': '21'
    };

    Exibir().nome(pessoaAdaptada);
  }
}

void main() {
  final Map pessoa = {'nome': 'Roberto', 'sobrenome': 'Alves', 'idade': '21'};

  Target exibir = Adapter();

  exibir.request(pessoa);
}
