<h1>Cenarios Moip API</h1>


<h2>Dependências</h2>
  <ul>
    <li>Ruby(recomendado a versão 2.3.0 ou mais atual)</li>
    <li>Gem Bundler Instalado http://bundler.io/</li>
  </ul>

<h2>Executando casos de testes</h2>
<h3>Exemplos</h3>
  <p>
    <p>cucumber (Esse comando executa todos os cenários de teste.)</p>
    <p>cucumber features/Order.feature (Esse comando executa todos os cenários de uma feature especifica.) 
    <p>Cucumber --tags @client (Executa uma tag especifica de um ou varios cenário.)</p>
  </p>

<h3>Features</h3>
<h4>Customer.feature</h4>
  <p>Essa feature foi desenvolvida com o proposito de testar as funcionalidades de criação de cliente, consulta de cliente e adição de um cartão de crédito a um cliente.</p>
<h5>Tags</h5>
  <ul>
    <li>@customer: Executa o cenario de teste correspondente a criação de clientes.</li>
    <li>@customerCheck: Executa o cenario de teste correspondente a consuta de um cliente já cadastrado.</li>
    <li>@addCard: Executa o cenario de teste correspondente a adição de um cartão de crédito a um usuário já cadastrado.</li>
  </ul>
  
  <h4>Order.feature</h4>
  <p>Essa feature foi desenvolvida com o proposito de testar as funcionalidades de criação de um pedido, consulta de determinado pedido e a listagem de pedidos.</p>
<h5>Tags</h5>
  <ul>
    <li>@order: Executa o cenario de teste correspondente a criação de um pedido.</li>
    <li>@orderCheck: Executa o cenario de teste correspondente a consuta de um pedido já cadastrado.</li>
    <li>@getOrderList: Executa o cenario de teste correspondente a consulta de todos os pedidos.</li>
  </ul>


<h4>Payment.feature</h4>
  <p>Essa feature foi desenvolvida com o proposito de testar as funcionalidades de  criar um pagamento, consultar um pagamento, capturar um e cancelar um pagamento pré-autorizado.</p>
<h5>Tags</h5>
  <ul>
    <li>@tag: Executa o cenario de teste correspondente a criação de clientes.</li>
    <li>@tag: Executa o cenario de teste correspondente a consuta de um cliente já cadastrado.</li>
    <li>@tag: Executa o cenario de teste correspondente a adição de um cartão de crédito a um usuário já cadastrado.</li>
    <li>@tag:</li>
  </ul>

<h2>Tags Adicionais</h2>
  <p>
    @h1/@h2: Tags que correspondem aos headers de cada requisição, informando o tipo de dados a ser passado e a chave de atutenticação Basic.
  </p>
  
  <h2>Relatório</h2>
    <p>
      Em geral os testes tiveram o desepenho esperado, cadastrando, consultando e listando normalmente a exceção de alguns erros tais como o cadastro de alguns dados, exemplo CPF, onde foi possivel cadastrar mais de uma vez o mesmo CPF. Além do CPF não foi possível cadastrar também a data de nascimento dos clientes e também, não foi possível a consulta de clientes cadastrados nos testes. Já na criação de pagamentos aconteceram alguns erros, onde não foi possível fazer post para a criação de pagamentos.
    </p>
