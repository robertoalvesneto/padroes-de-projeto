<h1>Abstract Factory</h1>
<p>Possui métodos que encapsulam a criação de objetos para que as classes não sejam acessadas diretamente.</p>

<h4>Vantagens</h4>
<ol>
    <li>As classes concretas dos objetos que queremos criar não são acessadas diretamente.</li>
    <li>Mudanças na forma da criação podem ser feitas em um local específico (nas factorys) e afetam todas as partes do código que a implementa.</li>
    <li>Como toda ConcreteFactory herda da AbstractFactory, elas podem ser trocadas entre si sem nenhum problema, e, se assim desejar, podem ser passadas por parâmetro (injeção de dependência), assim o usuário não sabe qual fábrica está usando.</li>
</ol>

<h4>Desvantagens</h4>
<ol>
    <li>Mudanças que não possam ser feitas através de herança são de difícil implementação.</li>
    <li>Requer o uso de outros designs patterns pois a instância dos objetos ainda continua muito próxima do usuário e verbosa.</li>
</ol>

<h4>Código</h4>
<p>O código implementado é dado como exemplo no livro de padrões de projetos com a pequena adaptação de ideia de um labirinto para uma casa.</p>
 <h5>Explicando a ideia das classes:</h5>
<p>Uma Casa pode possuir vários Quartos, um Quarto possui suas Paredes e uma Porta que permite acessar outros Quartos. Para construir o Quarto precisamos antes das Paredes e depois a Porta é colocada fazendo uma conexão entre dois quartos e por fim os Quartos que foram criados são adicionados a Casa.</p>
 <h5>Explicando a factory:</h5>
<p>É criada uma Abstract Factory para que todas as Concrete Factorys sejam obrigadas a implementar seus métodos e que, por terem um pai em comum, possam ser permutadas entre si sem conflito (Liskov substitution principle). Quando o usuário que criar a Parede para um Quarto ele chama da fabrica o método que cria a parede, encapsulando todo o processo de criação dessa Parede e não dando acesso direto a classe.</p>

<h4>Padrões relacionados</h4>
<p>A AbstractFactory a primeira vista pode ser bem <b>semelhante ao Builder</b>. Eles diferem no fato de que o Builder constrói e retorna um objeto complexo, enquanto a AbstractFactory determina vários métodos que servem para construir cada objeto, então o usuário utiliza desses métodos para construir o objeto final. O Builder pode ser usado em conjunto com uma ConcreteFactory, recebendo seu construtor por parâmetro e utilizando-o para construir seu objeto.</p>