<h1>Adapter</h1>
<p>Uma interface que serve de ponte entre o nosso programa e alguma funcionalidade que estamos querendo chamar. Como o nosso programa precisa da funcionalidade X, mas não consegue comunicar-se diretamente por N motivos, o Adapter serve de ponte para tornar essa comunicação possível.</p>
<p>Pode ainda ser usado como 'prevenção', visando que o plugin ou biblioteca que você esta utilizando possa sofrer modificações, ou ser substituído, fazer ele ter que passar por um adapter e então usar esse adapter no seu código isola essa ferramenta a uma parte so do código, facilitando futura substituição.</p>

<h4>Exemplos:</h4>
<p>Um exemplo do mundo real são as tomadas. Nosso computador precisa de energia e a tomada consegue fornecer a energia, mas se nosso carregador está no padrão antigo (retangular) e nossa tomada é de três pinos, a comunicação não pode ocorrer. Para resolver isso precisamos de um adaptador de tomada para fazer ambas se conectarem.</p>
<p>Quando estamos jogando em um emulador no computador pelo teclado as nossas teclas precisam ser mapeadas para o que seria cada botão do controle do videogame. O teclado não sabe que os comandos dele estão sendo convertidos, e o emulador não sabe que os comandos que estão chegando nele não são de um controle de verdade. Ambos funcionam normalmente sem saber da existência um do outro, nem do adaptador (que mapeia a tecla J para o botão BOLA, por exemplo).</p>
<p>No meu caso, programando em flutter, já utilizei plugins novos que eram feitos pela comunidade e que sofriam alterações rápido. Em um caso precisei atualizar a versão do plugin para receber uma correção de erro e nessa atualização os nomes das classes mudaram e os métodos passaram a ser estáticos, fazendo com que eu tivesse que modificar em todo o canto do código onde eu as usasse. Já em um caso dois, encontrei um plugin que funcionava melhor do que o que eu usava, então precisei substituir todo o código de um pelo outro. Em ambos os casos, se esses imports estivessem presos a um adapter X e eu usasse esse adapter no meu código, teria que fazer a atualização apenas em um lugar.</p>

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