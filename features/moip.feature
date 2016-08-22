Feature: Test of endpoints Moip

  @payment
  Scenario: Creating a o at endpoint v2/payment

  Given que o endpoint "v2/orders/ORD-VULX1EWDKXHF/payments" esta retornando "200"
  When eu faço um post para a criacao de um pagamento
  Then espero que a criacao do pagamento seja um sucesso e retorne "201"
