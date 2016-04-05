FactoryGirl.define do
  factory :rfid_reader_barcode_reader_pairing do
    rfid_reader
    barcode_reader
  end

  factory :invalid_rfid_reader_barcode_reader_pairing, parent: :rfid_reader_barcode_reader_pairing do
    rfid_reader nil
  end

  factory :updated_valid_rfid_reader_barcode_reader_pairing, parent: :rfid_reader_barcode_reader_pairing do
  end
end