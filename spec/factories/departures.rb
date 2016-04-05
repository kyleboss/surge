FactoryGirl.define do
  factory :departure do
    location
    trackable
  end

  factory :invalid_departure, parent: :departure do
    location nil
  end

  factory :updated_valid_departure, parent: :departure do
  end
end