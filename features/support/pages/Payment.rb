class Payment

  def postPayment
    values
    $response = RestClient.post $url + @endpoint, @val, $headers
  end

  def getPayment
    values
    $response = RestClient.get $url + @endpoint , $headers
  end

  def capturePayment
    values
    $response = RestClient.post $url + @endpoint + @idCap, $headers
  end

  def cancelPayment
    values
    $response = RestClient.post $url + @endpoint + @idCap, $headers
  end

  def parse_Json(code,file)
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
    File.open("./data/#{file}" , 'a') do |arg1|
      arg1 << variable
      arg1 << "\n\n"
    end
  end

  private
  def values
    @teste = "https://sandbox.moip.com.br/v2/payments/PAY-VZ1HI48256ZX"
    @endpoint = "v2/payments"
    @id = "/ORD-BLAFYKHPIQ3T"
    @idCap = "PAY-ZJOE0VPNGIM5/capture"
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
