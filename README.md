<h1>Cenários Moip API</h1>


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
    <li>@payment: Executa o cenario de teste correspondente a criação de um pagamento.</li>
    <li>@getPayment: Executa o cenario de teste correspondente a consuta de um pagamento cadastrado.</li>
    <li>@postPreAuthorized: Executa o cenario de teste correspondente a captura de um pagamento pré-autorizado.</li>
    <li>@postCPreAuthorized: Executa o cenario de teste correspondente ao cancelamento de um pagamento pré-autorizado</li>
  </ul>

<h2>Tags Adicionais</h2>
  <p>
    @h1/@h2: Tags que correspondem aos headers de cada requisição, informando o tipo de dados a ser passado e a chave de atutenticação Basic.
  </p>
  
  <h2>Executando os testes pelo postman</h2>
    <p>
      Para executar os testes utilizando ferramenta postman, primeiro a ferramenta deva ser baixada no link https://www.getpostman.com/ e somente pode ser instalada
      caso o google chrome esteja instalado.Após a instalação, dera ser feito o arquivo contido nesse repositório (moipTestesApi.postman_collection.json).
      Para executar os cenários de teste, sera nécessario a alreração de alguns valores: No cenário "Criação de um novo cliente" deverá ser alterado o paramnetro ownId, pois a api não aceita clientes com o mesmo id.
      Já no cenário "Get Cliente cadastrado", devera ser pego o id gerado na requesição anterior(ex:CUS-JWRXEM5GOOU7) e passar esse parametro na url(ex:https://sandbox.moip.com.br/v2/customers/CUS-JWRXEM5GOOU7), assim como no cenário "Adicionando um Cartão de Crédito", onde o id da criação de clientes deve ser adicionado a url (ex:https://sandbox.moip.com.br/v2/customers/CUS-JWRXEM5GOOU7/fundinginstruments).
      No cenário de "Criação de Pagamento", deverá ser passado no corpo da url, o id que foi gerado no cenário de "Adição de um pedido".Já nos cenários: "Consulta de um Pagamento Criado","Captura de um pagamento pré-autorizado" e "Cancelamento de um pagamento pré-autorizado", deverá ser passado o id gerado da requisição anterior(Ex:https://sandbox.moip.com.br/v2/payments/PAY-VZ1HI48256ZX).
    </p>
  
  <h2>Relatório</h2>
    <p>
      Em geral os testes manuais tiveram o resultado esperado, cadastrando, listando e consultando normalmente, salvo algumas exceções, onde foi possivel cadastrar o mesmo CPF e email, mais de uma vez ao mesmo cliente e onde também, não foi possivel fazer um pagamento pré-autorizado.
      Já nos teste automatizados, ocorreram varios problemas uma vez que as requisições para listar e cadastrar clientes, adicionar cartão a um cliente, gerar um pedido, criar, capturar e cancelar pagamento, não ocorriam ou não retornavam um resultado satisfatório.
    </p>
