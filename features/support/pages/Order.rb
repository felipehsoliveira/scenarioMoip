class Order

  def order_create
    values
    $response = RestClient.post $url + @endpoint, @val, $headers
  end
  def check_order
    values
  $response = RestClient.get $url + @endpoint + @id, $headers
  end

  def getOrderList(query)
    values
    $response = RestClient.get $url + @endpoint + "?#{query}" , $headers
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
    @fullname = 'Katrine Pollich'
    @email = 'jensen.koch@koepp.name'
    @ownId = 'CUS-6YIIM30PR41T'
    @endpoint = "v2/orders"
    @id = '/ORD-L36AYCS7FORC'
    @product = "Descrição do pedido"
    @quantity = 1
    @detail = "Mais info..."
    @price = "1000"
    @currency = "BRL"
    @shipping = 1000
    @val = "{
  'ownId': 'seu_identificador_proprio',
  'amount': {
    'currency': 'BRL',
    'subtotals': {
      'shipping': 1000
    }
  },
  'items': [
    {
      'product': 'Descrição do pedido',
      'quantity': 1,
      'detail': 'Mais info...',
      'price': 1000
    }
  ],
  'customer': {
    'ownId': 'seu_identificador_proprio_de_cliente',
    'fullname': 'Jose Silva',
    'email': 'nome@email.com',
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
      'street': 'Avenida Faria Lima',
      'streetNumber': 2927,
      'complement': 8,
      'district': 'Itaim',
      'city': 'Sao Paulo',
      'state': 'SP',
      'country': 'BRA',
      'zipCode': '01234000'
    }
  }
}"
  end
end
