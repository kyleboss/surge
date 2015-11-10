json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :phone, :address_id, :email, :password, :credit_card_id
  json.url user_url(user, format: :json)
end
