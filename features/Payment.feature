Feature: Teste de Pagamento Moip Api

  @payment @h1
  Scenario: Creating a o at endpoint v2/payment

  Given que o endpoint "v2/payments" esta retornando "200"
  When eu faço um post para a criacao de um pagamento
  Then espero que a resposta da acao retorne o codigo "201" e salve o resultado em "payment.txt"

  @getPayment @h1
  Scenario: get a payment at endpoint v2/payment

  Given que o endpoint "v2/payments" esta retornando "200"
  When Eu faço um get para a consulta de um pagamento
  Then espero que a resposta da consulta seja o codigo "200" e salve o resultado em "paymentCheck.txt"

  @postPreAuthorized @h1
  Scenario: capture a payment pre-authorized payment

  Given que o endpoint "v2/payments" esta retornando "200"
  When Eu faço um post para a consulta de um pagamento pré-autorizado
  Then espero que a resposta da consulta seja o codigo "200" e salve o resultado em "preAuthorizedRsp.txt"

  @postCPreAuthorized @h1
  Scenario: cancellation of a payment pre-authorized
  Given que o endpoint "v2/payments" esta retornando "200"

  When Eu faço um post para o cancelamento de um pagamento pré-autorizado
  Then Eu espero que a resposta da acao seja o codigo "200" e salve o resultado em "cancelPreAuthorized.txt"
