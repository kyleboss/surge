FactoryGirl.define do
  factory :location do
    name "Holding Room A"
  end

  factory :invalid_location, parent: :location do
    name nil
  end

  factory :updated_valid_location, parent: :location do
    name "Satellite Pharmacy A"
  end
end