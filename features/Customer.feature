Feature: Teste de Clientes

@customer @h2
Scenario: cadastro de cliente

Given que o endpoint "v2/customers" esta retornando "200"
When eu faço um post para a criacao de um cliente
Then espero que a criacao do cliente retorne "201" e salve o resultado no arquivo "clientResponse.txt"

@checkCustomer @h1
Scenario: consulta de cliente cadastrado

Given que o endpoint "v2/customers" esta retornando "200"
When eu faco um get para a consulta de um cliente cadastrado
Then espero que a consulta retorne o codigo "200" e salve o resultado da consulta em "clientCheck.txt"

@addCard @h1
Scenario: adicionar cartao de credito

Given que o endpoint "v2/customers" esta retornando "200"
When Eu faco um post para o cadastro de um cartao a um cliente
Then espero que o cadastro  retorne o codigo "201" e salve o resultado em "clientCard.txt"
