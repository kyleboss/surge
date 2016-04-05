FactoryGirl.define do
  factory :address do
    street_address "777 Lucky Way"
    city "Las Vegas"
    state "Nevada"
    zip_code "77777"
    country "USA"
  end

  factory :invalid_address, parent: :address do
    zip_code "abc"
  end

  factory :updated_valid_address, parent: :address do
    street_address "666 Unlucky Way"
  end
end