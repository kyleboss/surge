json.array!(@addresses) do |address|
  json.extract! address, :id, :street_address, :city, :state, :zip_code, :country
  json.url address_url(address, format: :json)
end
