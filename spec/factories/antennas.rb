FactoryGirl.define do

  factory :antenna do
    hardware_identifier "1569"
    location
  end

  factory :invalid_antenna, parent: :antenna do
    hardware_identifier nil
  end

  factory :updated_valid_antenna, parent: :antenna do
    hardware_identifier "1570"
  end
end