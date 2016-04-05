FactoryGirl.define do
  factory :trackable do
    admin_dose "5 mg"
    drug_name "phenytoin"
    brand_name "Dilantin"
    order_identifier "abc_123"
    med_identifier "123abc"
    sig "iamsig"
    admin "administer through arm"
    patient
  end

  factory :invalid_trackable, parent: :trackable do
    patient "abc"
  end

  factory :updated_valid_trackable, parent: :trackable do
    admin_dose "10 mg"
  end
end