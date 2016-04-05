FactoryGirl.define do
  factory :barcode_scan do
    transient do
      barcode_reader_hardware_identifier "abc123"
      barcode_code "123abc"
    end
    barcode_reader
    barcode
  end

  factory :invalid_barcode_scan, parent: :barcode_scan do
    barcode_reader_hardware_identifier nil
    barcode_code nil
  end

  factory :updated_valid_barcode_scan, parent: :barcode_scan do
  end
end