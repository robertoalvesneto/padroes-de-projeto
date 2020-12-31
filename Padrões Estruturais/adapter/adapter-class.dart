//CLASSE DE EXIBIÇÃO
class Exibir {
  void nome(Map pessoa) => print(pessoa['nomecompleto']);
}

//ADAPTER POR HERANÇA DE CLASSES
abstract class Target {
  request(Map pessoa);
}

class Adapter extends Target implements Exibir {
  @override
  void nome(Map pessoa) => print(pessoa['nome'] + ' ' + pessoa['sobrenome']);

  @override
  request(Map pessoa) => nome(pessoa);
}

void main() {
  final Map pessoa = {'nome': 'Roberto', 'sobrenome': 'Alves', 'idade': '21'};

  Target exibir = Adapter();

  exibir.request(pessoa);
}
