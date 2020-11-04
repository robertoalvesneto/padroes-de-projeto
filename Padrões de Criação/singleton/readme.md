<h1>Singleton</h1>
<p>A classe mantém guardada uma única instância sua e sempre retorna essa instância quando tentam construir um novo objeto.</p>

<h4>Vantagens</h4>
<ol>
  <li>Controle total sobre o acesso a essa instância.</li>
  <li>A mudança de ideia (desfazer o singleton ou permitir mais algumas instâncias) é de fácil implementação.</li>
</ol>

<h4>Código</h4>
<h5>Explicando a ideia da classe:</h5>
<p>A comunicação com o local em que armazenamos nossos dados - seja um banco externo, local, ou só um arquivo json - é mediada por uma classe que tem os métodos de acesso a ele. Não é necessário criar uma nova instância dessa classe toda vez que quisermos nos comunicar com o banco.</p>
<h5>Explicando o Singleton:</h5>
<p>Uma variável estática (para que possa ser acessada por métodos estáticos) e privada (para que não seja acessada diretamente) é criada e do tipo da nossa classe e inicializada como vazia.</p>
<p>Nosso método construtor é privado para que não possa ser criada novas instâncias.</p>
<p>Fazemos um método estático que funciona como nosso método construtor, se a nossa variável estiver vazia, ele chama o método construtor para inicializá-la, depois retorna a variável. Ou seja, todas as vezes que o singleton for chamado estamos passando uma referência para a mesma variável.</p>
 
<h4>Padrões relacionados</h4>
<p>Faz sentido que o <b>Abstract Factory</b>, <b>Builder</b> e <b>Prototype</b> sejam um Singleton.</p>