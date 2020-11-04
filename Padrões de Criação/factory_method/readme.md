<h1>Factory Method</h1>
<p>São métodos responsáveis por criar objetos complexos. Ele pode ser um método dentro da sua própria classe, onde ele organiza e chama todos os métodos privados, ou pode ser um método pertencente a uma outra classe que sabe qual objeto deve instanciar.</p>

<h4>Diferentes implementações</h4>
<p>Como esse método não pode ficar 'solto' no código é comum ele vir junto com outras estruturas, como a Abstract Factory e da Template Methods. Se não for esse o caso, temos que criar uma classe concreta para cada um dos métodos de criação e uma classe abstrata pai para permitir que essas classes concretas sejam permutáveis. A outra opção é só uma classe com todos os métodos de criação e com um método principal que recebe por parâmetro a instrução de qual desses métodos de criação usar.</p>

<h4>Vantagens</h4>
<p>Quase todas são semelhantes às da Abstract Factory.</p>
<ol>
    <li>As classes concretas dos objetos que queremos criar não são acessadas diretamente.</li>
    <li>Mudanças na forma da criação podem ser feitas em um local específico (nas factorys) e afetam todas as partes do código que a implementa.</li>
    <li>Como toda ConcreteFactory herda da AbstractFactory, elas podem ser trocadas entre si sem nenhum problema, e, se assim desejar, podem ser passadas por parâmetro (injeção de dependência), assim o usuário não sabe qual fábrica está usando.</li>
    <li>No caso da decisão entre tipos diferentes de construção de um mesmo objeto, removemos os ifs e switchs de dentro da main e o encapsulamos.</li>
</ol>

<h4>Desvantagens</h4>
<ol>
    <li>mudanças que não possam ser feitas através de herança são de difícil implementação.</li>
    <li>requer o uso de outros designs patterns pois a instância dos objetos ainda continua muito próxima do usuário e verbosa</li>
    <li>Pode fazer o código crescer rapidamente, devido a necessidade da criação de uma classe própria para esse metodo.</li>
</ol>

<h4>Código</h4>
<p>O código implementado é dado como exemplo no livro de padrões de projetos com a pequena adaptação de ideia de um labirinto para uma casa.</p>
 <h5>Explicando a ideia das classes:</h5>
<p>A ideia da construção da Casa foi resumida para apenas a construção do Quarto com suas Paredes. Temos diferentes tipos de Quartos que podemos construir e temos que criar uma forma de decidir e organizar construção.</p>
 <h5>Explicando a factory:</h5>
<p>Foram criados dois exemplos diferentes. Um onde o método consegue decidir quem implementar e retorna o tipo correto de Quarto e no segundo onde cada método fica isolado dentro da sua respectiva classe. É fácil de observar como a proliferação de classes ocorre de forma rápida.</p>

<h4>Padrões relacionados</h4>
<p>Ele normalmente vem dentro da <b>Abstract Factory</b> e da <b>Template Methods</b>. </p>