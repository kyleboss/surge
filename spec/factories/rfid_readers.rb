FactoryGirl.define do
  factory :rfid_reader do
    hardware_identifier "abc111"
    hospital
  end

  factory :invalid_rfid_reader, parent: :rfid_reader do
    hospital_id nil
  end

  factory :updated_valid_rfid_reader, parent: :rfid_reader do
    hardware_identifier "abc123"
  end
end