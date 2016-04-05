FactoryGirl.define do
  factory :arrival do
    location
    trackable
  end

  factory :invalid_arrival, parent: :arrival do
    location nil
  end

  factory :updated_valid_arrival, parent: :arrival do
  end
end