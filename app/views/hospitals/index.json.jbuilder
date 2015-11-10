json.array!(@hospitals) do |hospital|
  json.extract! hospital, :id, :name, :address_id, :user_id
  json.url hospital_url(hospital, format: :json)
end
