FactoryGirl.define do
  factory :barcode_trackable_pairing do
    barcode
    trackable
  end

  factory :invalid_barcode_trackable_pairing, parent: :barcode_trackable_pairing do
    barcode_id nil
  end

  factory :updated_valid_barcode_trackable_pairing, parent: :barcode_trackable_pairing do
  end
end