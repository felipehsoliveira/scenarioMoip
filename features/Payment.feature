Feature: Teste de Pagamento Moip Api

  @payment @h1
  Scenario: Creating a o at endpoint v2/payment

  Given the endpoint "v2/payments" is returning "200"
  When I do a post to create a payment
  Then I hope the post returns the code "201" and save the results in "payment.txt"

  @getPayment @h1
  Scenario: get a payment at endpoint v2/payment

  Given the endpoint "v2/payments/PAY-VZ1HI48256ZX" is returning "200"
  When I do a get for consulting a payment
  Then I hope the post returns the code "200" and save the results in "paymentCheck.txt"

  @postPreAuthorized @h1
  Scenario: capture a payment pre-authorized payment

  Given the endpoint "v2/payments" is returning "200"
  When I do a post for consulting a pre authorized payment
  Then I hope the post returns the code "200" and save the results in "preAuthorizedRsp.txt"

  @postCPreAuthorized @h1
  Scenario: cancellation of a payment pre-authorized

  Given the endpoint "v2/payments" is returning "200"
  When I make a post to the cancellation of a pre authorized payment
  Then I hope the post returns the code "200" and save the results in "cancelPreAuthorized.txt"
