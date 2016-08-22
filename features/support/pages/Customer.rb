class Customer

  def customer_create
    values
    $response = RestClient.post $url + @endpoint, @val, $headers
  end

  def add_card
    values
    $response = RestClient.post $url + @endpoint, @val, $headers
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
    @fullname = Faker::Name.name
    field_gsub(@fullname)
    @email = Faker::Internet.email
    @ownId = rand(100000..999999).to_s
    @birthdate = '01-08-1990'
    @numberCpf = '14040150864'
    @countryCode = '55'
    @areaCode = '11'
    @numberTel = '55555555'
    @city = 'Sao Paulo'
    @complement = '8'
    @district = 'Itaim'
    @street = 'Avenida Faria Lima'
    @streetNumber = '297'
    @zipcode = '01234000'
    @state = 'SP'
    @country = 'BRA'

    @endpoint = "v2/customers/"
    @id = "CUS-48T726N0IGJ9"
    @val = "{'ownId': '#{@ownId}',
    'fullname': '#{@fullname}',
    'email': '#{@email}',
    'birthdate':'#{@birthdate}',
    'taxDocument':{
      'type': 'CPF',
      'number': '#{@numberCpf}'
    },
    'phone':{
      'countryCode':'#{@countryCode}',
      'areaCode': '#{@areaCode}',
      'number': '#{@numberTel}'
    },
    'shippingAddress':{
      'city': '#{@city}',
      'complement':'#{@complement}',
      'district':'#{@district}',
      'street':'#{@street}',
      'streetNumber':'#{@streetNumber}',
      'zipCode':'#{@zipcode}',
      'state':'#{@state}',
      'country':'#{@country}'
    }
  }"

  end

  def field_gsub(var)
    if var.include?("'")
      var = var.gsub!("'", "")
    end
  end
=begin
  def valuesCard
    @val = "{'method': 'CREDIT_CARD',
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

    }"
=end

end
