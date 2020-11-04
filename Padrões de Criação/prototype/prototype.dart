//Fiz essa classe em inglês para ficar claro que é igual a outra classe Pessoa.
//O diferencial fica apenas em essa aqui se limitar a ela mesma e a outra ser
//uma classe mãe.
class People {
  String name;
  double height;
  int age;

  People(this.name, this.height, this.age);

  //Método construtor que utiliza uma instância de pessoa.
  People.clone(People people) {
    name = people.name;
    age = people.age;
    height = people.height;
  }

  //método de clonagem que é chamado na própria instância.
  clone() {
    return People.clone(this);
  }
}

//Cada classe possui o seu método de clonagem que será chamado quando tentar
//copiar o objeto principal. Caso não fosse feito assim, a variável teria apenas
//uma cópia daquela região da memória, então quando o objeto principal alterasse
//seu valor, alteraria o do objeto clonado.
abstract class Pessoa {
  String nome;
  double altura;
  int idade;

  Pessoa(this.nome, this.altura, this.idade);

  Pessoa.clone(Pessoa instancia) {
    nome = instancia.nome;
    altura = instancia.altura;
    idade = instancia.idade;
  }

  Pessoa clone();
}

class Endereco {
  String bairro;
  String rua;
  int numero;

  Endereco(this.bairro, this.rua, this.numero);

  Endereco.clone(Endereco instancia) {
    bairro = instancia.bairro;
    rua = instancia.rua;
    numero = instancia.numero;
  }

  Endereco clone() {
    return Endereco.clone(this);
  }
}

class Cidadao extends Pessoa {
  String cpf;
  Endereco endereco;

  Cidadao(String nome, double altura, int idade, this.cpf, this.endereco)
      : super(nome, altura, idade);

  Cidadao.clone(Cidadao instancia) : super.clone(instancia) {
    cpf = instancia.cpf;
    endereco = instancia.endereco.clone();
  }

  @override
  Pessoa clone() {
    return Cidadao.clone(this);
  }
}

//Essas duas funções são apenas para não deixar tudo isso dentro da main, acho
//muito poluído.
void clonagemCLasseSimples() {
  //mostrando a clonagem de classes simples.
  People a = People('joao', 1.72, 23);
  People b = a.clone();

  print("nome da pessoa: " + a.name);
  a.name = 'roberto';
  print("nome alterado da pessoa: " + a.name);
  print("nome da pessoa clonada: " + b.name);
}

void clonagemClasseComplexa() {
  //mostrando o funcionamento do deep copy.
  Endereco end = Endereco('bairro', 'rua', 15);
  Cidadao pessoa = Cidadao('joao', 1.72, 23, '000.000.000-00', end);
  Cidadao pessoaClone = pessoa.clone();

  pessoa.nome = 'carlos';
  pessoa.endereco.bairro = 'Zona Leste';
  pessoa.endereco.rua = 'abc';
  pessoa.endereco.numero = 12;

  print("Nome e endereço alterados da pessoa: ");
  print(pessoa.nome);
  print(pessoa.endereco.bairro +
      " " +
      pessoa.endereco.rua +
      " " +
      pessoa.endereco.numero.toString());
  print("\nNome e endereço da pessoa clonada antes da alteração:");
  print(pessoaClone.nome);
  print(pessoaClone.endereco.bairro +
      " " +
      pessoaClone.endereco.rua +
      " " +
      pessoaClone.endereco.numero.toString());
}

void main() {
  clonagemCLasseSimples();

  print("\n\n");

  clonagemClasseComplexa();
}
