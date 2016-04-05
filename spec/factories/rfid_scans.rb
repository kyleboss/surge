FactoryGirl.define do
  factory :rfid_scan do
    rfid_reader
    rfid
  end

  factory :invalid_rfid_scan, parent: :rfid_scan do
    rfid_reader_id nil
  end

  factory :updated_valid_rfid_scan, parent: :rfid_scan do
  end
end