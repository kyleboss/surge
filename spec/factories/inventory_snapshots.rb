FactoryGirl.define do
  factory :inventory_snapshot do
    location
  end

  factory :invalid_inventory_snapshot, parent: :inventory_snapshot do
    location nil
  end

  factory :updated_valid_inventory_snapshot, parent: :inventory_snapshot do
  end
end