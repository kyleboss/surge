FactoryGirl.define do
  factory :patient do
    mrn "123abc"
    name "Joe Allen"
    hospital
  end

  factory :invalid_patient, parent: :patient do
    hospital nil
  end

  factory :updated_valid_patient, parent: :patient do
    name "Joe Smith"
  end
end