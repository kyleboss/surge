FactoryGirl.define do
  factory :rfid do
    hardware_identifier "abc123"
  end

  factory :invalid_rfid, parent: :rfid do
    hardware_identifier nil
  end

  factory :updated_valid_rfid, parent: :rfid do
    hardware_identifier "123abc"
  end
end