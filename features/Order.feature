Feature: Teste dos Pedidos Api Moip

@order @h1

Scenario: Criar um pedido no endpoint order/v2

Given que o endpoint "v2/orders" esta retornando "200"
When eu faço uma requisicao post para a criacao de um pedido
Then espero que a requisicao retorne "201" e salve o retorno em "orderReponse.txt"

@checkOrder @h1

Scenario: Verificar o pedido criado no endpoint order/v2

Given que o endpoint "v2/orders" esta retornando "200"
When Eu faco uma consulta get para a criacao de um pedido
Then espero que a consulta retorne o codigo de resposta "200" e salve o resultado da busca em "checkOrder.txt"

@getOrderList @h1
Scenario: Listar todos os pedidos do endpoint order/v2

Given que o endpoint "v2/orders" esta retornando "200"
When Eu faco uma consulta get de "q=a&limit=10" um pedido
Then espero que a consulta retorne todos os pedidos e o codigo "200" e salvo no arquivo "orderList.txt"
