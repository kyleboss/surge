FactoryGirl.define do
  factory :user do
    first_name "Steven"
    middle_initial "S"
    last_name "Smith"
    phone "4567891234"
    email "steven@kaiser.com"
    password "password"
  end

  factory :invalid_user, parent: :user do
    password nil
  end

  factory :updated_valid_user, parent: :user do
    first_name "Steve"
  end
end