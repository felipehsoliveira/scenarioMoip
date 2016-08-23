Feature: Teste de Clientes

@customer @h2
Scenario: cadastro de cliente

Given the endpoint "v2/customers" is returning "200"
When I do a post fo the creation of a customer
Then I hope the creation return "201" and save the resulting file in "clientResponse.txt"

@checkCustomer @h1
Scenario: consulta de cliente cadastrado

Given the endpoint "v2/customers" is returning "200"
When I do a get for the query from a client
Then I hope that the query returns the code "200" and save the query result in "clientCheck.txt"

@addCard @h1
Scenario: adicionar cartao de credito

Given the endpoint "v2/customers" is returning "200"
When I do a post for the registration of a card to a customer
Then I hope the registry returns the code "201" and save the results in "clientCard.txt"
