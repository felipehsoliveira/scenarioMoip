#cliente/pedido/pagamento
Given(/^the endpoint "([^"]*)" is returning "([^"]*)"$/) do |endpoint, code|
  response = RestClient.get $url + endpoint, $headers
  if response.code == code.to_i
    puts "Code pass"
  else
    raise "Code error"
  end
end
#cadastro postCliente
When(/^I do a post fo the creation of a customer$/) do
  Customer.new.customer_create
end

Then(/^I hope the creation return "([^"]*)" and save the resulting file in "([^"]*)"$/) do |code, file|
  Customer.new.parse_Json(code, file)
end
#getCliente
When(/^I do a get for the query from a client$/) do
  Customer.new.customer_check
end

Then(/^I hope that the query returns the code "([^"]*)" and save the query result in "([^"]*)"$/) do |code, file|
  Customer.new.parse_Json(code, file)
end

#postCartaoCliente
When(/^I do a post for the registration of a card to a customer$/) do
  Customer.new.add_card
end

Then(/^I hope the registry returns the code "([^"]*)" and save the results in "([^"]*)"$/) do |code, file|
  Customer.new.parse_Json(code,file)
end

#postPedido
When(/^I make a post request for the creation of a new order$/) do
  Order.new.order_create
end

Then(/^I hope that request returns "([^"]*)" and save the return in "([^"]*)"$/) do |code, file|
  Order.new.parse_Json(code,file)
end

#getPedido
When(/^I do get an appointment to check a order$/) do
  Order.new.check_order
end

Then(/^I hope that the query returns the response code "([^"]*)" and save the search results in "([^"]*)"$/) do |code, file|
  Order.new.parse_Json(code, file)
end

#getOrderList

When(/^I do a get query "([^"]*)" to list the orders$/) do |query|
  Order.new.getOrderList(query)
end

Then(/^I hope that the query returns the code "([^"]*)" and save the results in the file "([^"]*)"$/) do |code , file|
  Order.new.parse_Json(code, file)
end


#pagamentos

#postPayment
When(/^I do a post to create a payment$/) do
  Payment.new.postPayment
end

#getPayment
When(/^I do a get for consulting a payment$/) do
  Payment.new.getPayment
end

#getPreAuthorized
When(/^I do a post for consulting a pre authorized payment$/) do
  Payment.new.capturePayment
end

#cancelPreAuthorized
When(/^I make a post to the cancellation of a pre authorized payment$/) do
  Payment.new.cancelPayment
end

Then(/^I hope the post returns the code "([^"]*)" and save the results in "([^"]*)"$/) do |code, file|
  Payment.new.parse_Json(code, file)
end
