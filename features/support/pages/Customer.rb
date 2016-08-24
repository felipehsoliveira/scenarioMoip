class Customer

  def customer_create
    values
    RestClient.get 'https://sandbox.moip.com.br/v2/customers', $headers
    $response = RestClient.post $url + @endpoint, @val, $headers
    binding.pry
  end

  def add_card
    card
    binding.pry
    $response = RestClient.post $url + @endpoint, @values, $headers
  end

  def parse_Json(code, file)
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

  def customer_check
    values
    binding.pry
    $response = RestClient.get $url + @endpoint + @id, $headers
  end


  private

  def values
    @rand = rand(1..99999999999999999999)
    @rand = @rand.to_s
    @endpoint = "v2/customers"
    @val = "{
    'ownId': '#{@rand}',
    'fullname': 'Jose Silvaa',
    'email': 'jose_silva02@email.com',
    'birthDate': '1988-12-30',
    'taxDocument': {
      'type': 'CPF',
      'number': '22222222222'
    },
    'phone': {
      'countryCode': '55',
      'areaCode': '11',
      'number': '66778899'
    },
    'shippingAddress': {
      'city': 'Sao Paulo',
      'complement': '8',
      'district': 'Itaim',
      'street': 'Avenida Faria Lima',
      'streetNumber': '2927',
      'zipCode': '01234000',
      'state': 'SP',
      'country': 'BRA'
    }
  }"
  end

  def card
    @idCustomer = "CUS-J8XPHEX6Q1TV"
    @endpoint = "v2/customers/CUS-6FGFDZ1QROZV/fundinginstruments"
    @values = "{
    'method': 'CREDIT_CARD',
    'creditCard': {
    'expirationMonth': '05',
    'expirationYear': '18',
    'number': '4012001038443335',
    'cvc': '123',
    'holder': {
      'fullname': 'Jose Silvaa',
      'birthdate': '1988-12-30',
      'taxDocument': {
        'type': 'CPF',
        'number': '22222222222'
      },
      'phone': {
        'countryCode': '55',
        'areaCode': '11',
        'number': '66778899'
      }
    }
  }
}"

  end
end
