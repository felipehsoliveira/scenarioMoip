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
    @val = "{'ownId': '#{@ownId}',
      'amount': {
        'currency': '#{@currency}',
        'subtotals': {
            'shipping' :'#{@shipping}'
        }
      },
      'items': [
        {
          'product': '#{@product}',
          'quantity': '#{@quantity}',
          'detail': '#{@detail}',
          'price': '#{@price}'
        }
      ]
    }"
  end
end
