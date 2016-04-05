FactoryGirl.define do
  factory :inventory_snapshot_content do
    inventory_snapshot
    trackable
  end

  factory :invalid_inventory_snapshot_content, parent: :inventory_snapshot_content do
    inventory_snapshot nil
  end

  factory :updated_valid_inventory_snapshot_content, parent: :inventory_snapshot_content do
  end
end