FactoryGirl.define do
  factory :barcode do
    code "abcdefgh"
  end

  factory :invalid_barcode, parent: :barcode do
    code nil
  end

  factory :updated_valid_barcode, parent: :barcode do
    code "12345678"
  end
end