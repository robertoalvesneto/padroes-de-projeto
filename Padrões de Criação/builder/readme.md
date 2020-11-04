<h1>Builder</h1>
<p>Uma classe que cria um objeto complexo e retorna sua instância.</p>
<p>É retornado o objeto final construído da forma que o builder desejar (com atributos e estruturas que ele quiser) sem que o usuário tome conhecimento de como esse objeto foi construído.</p>
  
<h4>Vantagens</h4>
<ol>
   <li>Isola o código de criação do objeto, melhorando a sua visualização e controle devido o encapsulamento.</li>
   <li>É possível ter vários ConcreteBuilders e substituir um pelo outro conforme a necessidade e o objeto que se queira criar.</li>
   <li>A forma de construção desse objeto fica oculta.</li>
</ol>
 
<h4>Código</h4>
<p>O código implementado é dado como exemplo no livro de padrões de projetos com a pequena adaptação de ideia de um labirinto para uma casa.</p>
 <h5>Explicando a ideia das classes:</h5>
<p>Uma Casa pode possuir vários Quartos, um Quarto possui suas Paredes e uma Porta que permite acessar outros Quartos. Para construir o Quarto precisamos antes das Paredes e depois a Porta é colocada fazendo uma conexão entre dois quartos e por fim os Quartos que foram criados são adicionados a Casa.</p>
 <h5>Explicando o builder:</h5>
<p>A planta de uma Casa contém toda a informação de como será aquela Casa. A partir de uma planta podemos criar quantas Casas quisermos, porém todas iguais. É isso que um ConcreteBuilder faz, ele possui o 'desenho' específico de como construir um tipo de Casa (objeto). Caso queiramos outros tipos de Casa - com mais Quartos, por exemplo - precisamos de uma outra planta (outro ConcreteBuilder). Para que esses concretes sejam intercambiáveis temos uma classe pai AbstractBuilder.</p>
<p>Tudo que o usuário sabe é qual planta foi utilizada e então ele recebeu uma instância da Casa criada exatamente como o Builder quis que fosse criado, o usuário não consegue nem enxergar o desenho dessa planta.</p>

<h4>Padrões relacionados</h4>
<p>A AbstractFactory a primeira vista pode ser bem semelhante ao Builder. Eles diferem no fato de que o Builder constrói e retorna um objeto complexo, enquanto a AbstractFactory determina vários métodos que servem para construir cada objeto, então o usuário utiliza desses métodos para construir o objeto final. O Builder pode ser usado em conjunto com uma ConcreteFactory, recebendo seu construtor por parâmetro e utilizando-o para construir seu objeto.</p>
