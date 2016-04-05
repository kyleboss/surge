FactoryGirl.define do
  factory :hospital do
    name "Kaiser Hospital"
  end

  factory :invalid_hospital, parent: :hospital do
    name nil
  end

  factory :updated_valid_hospital, parent: :hospital do
    name "Kaiser Oakland"
  end
end