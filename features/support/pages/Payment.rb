class Payment

  def order_payment
    values
    binding.pry
    $response = RestClient.post $url + @endpoint, @val, $headers
  end

  def parse_Json(code)
    #binding.pry
    if $response.code == code.to_i
      $response = JSON.parse($response)
    else
      raise "Code Error"
    end

    variable = ''
    $response.each do |x|
      variable += "#{x.to_s}: #{x[0].to_s}\n"
    end
    File.open('./data/paymentResponse.txt' , 'w') do |arg1|
      arg1 << variable
    end
  end

  private
  def values
    @endpoint = "v2/orders/#{$order_id}/payments"
    @val = "{'installmentCount': 1,
    fundingInstrument: {
        'method': 'CREDIT_CARD',
        'creditCard': {
            'expirationMonth': '05',
            'expirationYear': '18',
            'number': '5555666677778884',
            'cvc': '123',
            'holder': {
                'fullname': 'Jose Portador da Silva',
                'birthdate': '1988-12-30',
                'taxDocument': {
                    'type': 'CPF',
                    'number': '33333333333'
                },
                'phone': {
                    'countryCode': '55',
                    'areaCode': '11',
                    'number': '66778899'
                }
            }
        }
    }
}"
  end
end
