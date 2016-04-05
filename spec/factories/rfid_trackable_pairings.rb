FactoryGirl.define do
  factory :rfid_trackable_pairing do
    rfid
    trackable
  end

  factory :invalid_rfid_trackable_pairing, parent: :rfid_trackable_pairing do
    rfid_id nil
  end

  factory :updated_valid_rfid_trackable_pairing, parent: :rfid_trackable_pairing do
  end
end