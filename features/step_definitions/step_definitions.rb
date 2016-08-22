#cliente/pedido/pagamento
Given(/^que o endpoint "([^"]*)" esta retornando "([^"]*)"$/) do |endpoint, code|
  response = RestClient.get $url + endpoint, $headers
  if response.code == code.to_i
    puts "Code pass"
  else
    raise "Code error"
  end
end
#cadastro postCliente
When(/^eu faço um post para a criacao de um cliente$/) do
  Customer.new.customer_create
end

Then(/^espero que a criacao do cliente retorne "([^"]*)" e salve o resultado no arquivo "([^"]*)"$/) do |code, file|
  Customer.new.parse_Json(code, file)
end
#getCliente
When(/^eu faco um get para a consulta de um cliente cadastrado$/) do
  Customer.new.customer_check
end

Then(/^espero que a consulta retorne o codigo "([^"]*)" e salve o resultado da consulta em "([^"]*)"$/) do |code, file|
  Customer.new.parse_Json(code, file)
end

#postCartaoCliente
When(/^Eu faco um post para o cadastro de um cartao a um cliente$/) do
  Customer.new.add_card
end

Then(/^espero que o cadastro  retorne o codigo "([^"]*)" e salve o resultado em "([^"]*)"$/) do |code, file|
  Customer.new.parse_Json(code,file)
end

#postPedido
When(/^eu faço uma requisicao post para a criacao de um pedido$/) do
  Order.new.order_create
end

Then(/^espero que a requisicao retorne "([^"]*)" e salve o retorno em "([^"]*)"$/) do |code, file|
  Order.new.parse_Json(code,file)
end

#getPedido
When(/^Eu faco uma consulta get para a criacao de um pedido$/) do
  Order.new.check_order
end

Then(/^espero que a consulta retorne o codigo de resposta "([^"]*)" e salve o resultado da busca em "([^"]*)"$/) do |code, file|
  Order.new.parse_Json(code, file)
end

#getOrderList

When(/^Eu faco uma consulta get de "([^"]*)" um pedido$/) do |query|
  Order.new.getOrderList(query)
end

Then(/^espero que a consulta retorne todos os pedidos e o codigo "([^"]*)" e salvo no arquivo "([^"]*)"$/) do |code , file|
  Order.new.parse_Json(code, file)
end


#pagamentos
