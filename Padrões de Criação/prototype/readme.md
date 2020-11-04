<h1>Prototype</h1>
<p>Serve para criar e retornar a cópia de um objeto já criado.</p>
  
<h4>Vantagens</h4>
<ol>
   <li>No caso de objetos que possuem uma criação complexa, porém que suas instâncias se diferenciam pelos valores de seus atributos, pode ser mais adequado clonar e modificar o valor do que criar um novo com os valores diferentes. Ex: o que diferencia as instâncias de uma classe pessoa são os valores dos atributos nome, idade, CPF etc.</li>
   <li>No caso de a diferença das instâncias se dar pelos valores dos atributos, Prototype será mais simples, em termos de código, que um Factory Method (Requer a criação de uma classe mãe e subclasses específicas para cada um dos possíveis objetos a serem criados).</li>
   <li>Como a nova instância está recebendo o retorno do método clone aplicado na instância original, a forma de construção desse objeto fica oculta.</li>
</ol>
  
<h4>Desvantagem</h4>
<ol>
   <li>A clonagem de classes que utilizam de várias outras classes pode ser complexa, ainda mais se essa implementação estiver sendo aplicada em um código que já existe. Ex: para clonar a classe Pessoa que guarda uma instância da classe Endereço e outra da classe Contatos teremos que criar e chamar métodos de clonagem em ambas as classes.</li>
</ol>
  
<h4>Exemplos</h4>
<p>Os exemplos a seguir não necessariamente utilizam essa técnica, mas são possíveis lugares de utilização dela.</p>
<p>Ferramentas de prototipação como o Figma e Lucidchart onde arrastamos componentes como setas, retângulos e círculos de um menu para dentro do nosso projeto e então modificamos seus atributos para deixá-los como queremos. Esses componentes são inicialmente todos iguais, então essa arrastada pode significar a copia da instância desse componente.</p>
<p>Jogos de mundo aberto onde existem vários NPCs pelo cenário. Alguns NPCs são de fato diferentes, enquanto outros são cópias com algumas características de aparência diferentes para de longe parecer que são todos diferentes. Ao se aproximar não é muito difícil encontrar fisionomias, falas e comportamentos iguais, porém com uma cor de cabelo ou roupa diferente.</p>

<h4>Código</h4>
<p>A primeira classe ‘People’ serve para demonstrar como é fácil a clonagem quando não temos herança ou composição entre classes. Em seguida temos um conjunto de classes onde o Cidadão possui um Endereço e herda de Pessoa, ela serve para mostrar que cada uma dessas classes precisa implementar seu método de clonagem.</p>

<h4>Padrões relacionados</h4>
<p>Ele pode vir dentro da <b>Abstract Factory</b> ou ser usado em conjunto com o <b>Composite</b> e <b>Decorator</b>.</p>