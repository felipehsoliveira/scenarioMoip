Before do
  $url = "https://sandbox.moip.com.br/"
end

Before('@h2') do
  $headers = {
  :content_type => 'application/json',
  :authorization => 'Basic MEVSVkROMzg2V0UzUlpSSTRZWUc2UUNETE1KNTdMQlI6U1JaR0hSWFlPVDBQVkRMUkIzWUU4WFFXTE5MQTBKUlhUS09JRFZEUQ=='
}

end
Before('@h1') do
  $headers = {
  :content_type => 'application/json',
  :authorization => 'Basic MDEwMTAxMDEwMTAxMDEwMTAxMDEwMTAxMDEwMTAxMDE6QUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQkFCQUJBQg=='
}
end
