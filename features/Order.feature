Feature: Teste dos Pedidos Api Moip

@order @h1

Scenario: Criar um pedido no endpoint order/v2

Given the endpoint "v2/orders" is returning "200"
When I make a post request for the creation of a new order
Then I hope that request returns "201" and save the return in "orderReponse.txt"

@checkOrder @h1

Scenario: Check the order created in order endpoint/v2

Given the endpoint "v2/orders" is returning "200"
When I do get an appointment to check a order
Then I hope that the query returns the response code "200" and save the search results in "checkOrder.txt"

@getOrderList @h1
Scenario: List all orders from the endpoint v2/orders

Given the endpoint "v2/orders" is returning "200"
When I do a get query "that & limit = 10" to list the orders
Then I hope that the query returns the code "200" and save the results in the file "orderList.txt"
