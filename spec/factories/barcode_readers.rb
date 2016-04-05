FactoryGirl.define do
  factory :barcode_reader do
    hardware_identifier "abc111"
    hospital
  end

  factory :invalid_barcode_reader, parent: :barcode_reader do
    hospital_id nil
  end

  factory :updated_valid_barcode_reader, parent: :barcode_reader do
    hardware_identifier "abc123"
  end
end