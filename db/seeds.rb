# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

patient_names = ["George Washington", "John Adams", "Thomas Jefferson", "James Madison", "James Monroe",
                 "John Quincy Adams", "Andrew Jackson", "Martin Van Buren", "William Henry Harrison"]

Address.create(street_address: "3000 Las Positas Rd", city: "Livermore", state: "CA", zip_code: 94551, country: "USA")
Address.create(street_address: "7601 Stoneridge Dr", city: "Pleasanton", state: "CA", zip_code: 94588, country: "USA")
Address.create(street_address: "3600 Broadway", city: "Oakland", state: "CA", zip_code: 94611, country: "USA")
Address.create(street_address: "2600 Ridge Rd", city: "Berkeley", state: "CA", zip_code: 94709, country: "USA")
Address.create(street_address: "6802 Becknell Dr", city: "Colo Springs", state: "CO", zip_code: 80923, country: "USA")

Hospital.create(name: "Kaiser Livermore", address_id: 1)
Hospital.create(name: "Kaiser Oakland", address_id: 3)
Hospital.create(name: "Kaiser Pleasanton", address_id: 2)

User.create(first_name: "Kyle", last_name: "Boss", phone: "9316241119", address_id: 4, email: "kyle@kyleboss.com",
            password: "0c731a5f1dc781894b434c27b9f6a9cd9d9bdfcb", middle_initial: "A", hospital_id: 1)
User.create(first_name: "Barrack", last_name: "Obama", phone: "7192641234", address_id: 5, email: "obama@potus.com",
            password: "5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8", middle_initial: "E", hospital_id: 3)
User.create(first_name: "Mich", last_name: "Obama", phone: "9315382508", address_id: 5, email: "michelle@flotus.com",
            password: "e1d07f4e877234d2583a9511cc629ead4c4a68fa", middle_initial: "G", hospital_id: 2)

hospital1 = Hospital.find(1)
hospital2 = Hospital.find(2)
hospital3 = Hospital.find(3)

hospital1.administrator_id = 1
hospital2.administrator_id = 3
hospital3.administrator_id = 2

hospital1.save
hospital2.save
hospital3.save

3.times do |hospital_id|
  hospital_id += 1
  5.times do |location_id|
    location_id += 1
    if (location_id == 1)
      new_location = Location.create(name: "Main Pharmacy", hospital_id: hospital_id)
    else
      new_location = Location.create(name: "Location #{location_id}", hospital_id: hospital_id)
    end
    2.times do |antenna_id|
      antenna_id += 1
      antenna_unique_identifier = "#{hospital_id}-#{location_id}-#{antenna_id}"
      Antenna.create(uniq_id: antenna_unique_identifier, location_id: new_location.id)
    end
  end
  3.times do |reader_id|
    reader_id += 1
    BarcodeReader.create(reader_id: "#{hospital_id}-#{reader_id}", hospital_id: hospital_id)
    RfidReader.create(reader_id: "#{hospital_id}-#{reader_id}", hospital_id: hospital_id)
  end
  RfidReaderBarcodeReaderPairing.create(barcode_reader_id: 1+(hospital_id-1)*3, rfid_reader_id: 1+(hospital_id-1)*3)
  RfidReaderBarcodeReaderPairing.create(barcode_reader_id: 2+(hospital_id-1)*3, rfid_reader_id: 3+(hospital_id-1)*3)
  RfidReaderBarcodeReaderPairing.create(barcode_reader_id: 3+(hospital_id-1)*3, rfid_reader_id: 2+(hospital_id-1)*3)
  3.times do |patient_id|
    patient_id += 1
    mrn_identifier = "#{hospital_id}-#{patient_id}"
    new_patient = Patient.create(name: patient_names[patient_id-1], mrn: mrn_identifier, hospital_id: hospital_id)
    3.times do |trackable_id|
      trackable_unique_identifier = "#{hospital_id}-#{patient_id}-#{trackable_id}"
      Trackable.create(patient_id: new_patient.id, admin_dose: "admin_dose", drug_name: "drug_name",
                       brand_name: "brand_name", order_id: trackable_unique_identifier, med_id: "med_id", sig: "sig",
                       admin: "admin")
      Rfid.create(rfid_id: "#{hospital_id}-#{patient_id}-#{trackable_id*3}")
    end
  end
end

new_patient = Patient.create(name: "John Mayfield", mrn: "23332502", hospital_id: 1)
trackable_0 = Trackable.create(patient_id: new_patient.id, admin_dose: "5mg", drug_name: "Oxycodone",
                 brand_name: "Oxycontin", order_id: "000", med_id: "3245342523", sig: "5342523",
                 admin: "Must take OXYCONTIN tablets whole, with enough water to ensure complete swallowing
immediately after placing in the mouth. Must take OXYCONTIN tablets one tablet at a time and must not
pre-soak, lick or otherwise wet the tablet prior to placing in the mouth")
trackable_1 = Trackable.create(patient_id: new_patient.id, admin_dose: "30mg", drug_name: "Nifedipine",
                 brand_name: "Adalat", order_id: "001", med_id: "4523452345", sig: "74567",
                 admin: "Take on empty stomach")
trackable_2 = Trackable.create(patient_id: new_patient.id, admin_dose: "5mg", drug_name: "Cholestyramine",
                 brand_name: "Questran", order_id: "002", med_id: "89234057", sig: "3245",
                 admin: "The suggested time of administration is at mealtime but may be modified to avoid
interference with absorption of other medications. Although the recommended dosing schedule is twice
daily, QUESTRAN may be administered in 1–6 doses per day. QUESTRAN should not be taken in its dry form.
Always mix QUESTRAN with water or other fluids before ingesting.")


rfid_0 = Rfid.create(rfid_id: "000")
rfid_1 = Rfid.create(rfid_id: "001")
rfid_2 = Rfid.create(rfid_id: "002")

RfidTrackablePairing.create(rfid_id: rfid_0.id, trackable_id: trackable_0.id)
RfidTrackablePairing.create(rfid_id: rfid_1.id, trackable_id: trackable_1.id)
RfidTrackablePairing.create(rfid_id: rfid_2.id, trackable_id: trackable_2.id)

main_pharmacy       = Location.create(name: "Main Pharmacy", hospital_id: 1)
east_wing_pharmacy  = Location.create(name: "East Wing Pharmacy", hospital_id: 1)
west_wing_pharmacy  = Location.create(name: "West Wing Pharmacy", hospital_id: 1)


arrival_0   = Arrival.create(location_id: main_pharmacy.id, trackable_id: trackable_0.id)
departure_0 = Departure.create(location_id: main_pharmacy.id, trackable_id: trackable_0.id)
arrival_1   = Arrival.create(location_id: east_wing_pharmacy.id, trackable_id: trackable_0.id)
departure_1 = Departure.create(location_id: east_wing_pharmacy.id, trackable_id: trackable_0.id)
arrival_2   = Arrival.create(location_id: west_wing_pharmacy.id, trackable_id: trackable_0.id)
departure_2 = Departure.create(location_id: west_wing_pharmacy.id, trackable_id: trackable_0.id)

arrival_3   = Arrival.create(location_id: main_pharmacy.id, trackable_id: trackable_1.id)
departure_3 = Departure.create(location_id: main_pharmacy.id, trackable_id: trackable_1.id)
arrival_4   = Arrival.create(location_id: east_wing_pharmacy.id, trackable_id: trackable_1.id)

arrival_5   = Arrival.create(location_id: main_pharmacy.id, trackable_id: trackable_2.id)
departure_4 = Departure.create(location_id: main_pharmacy.id, trackable_id: trackable_2.id)
arrival_6   = Arrival.create(location_id: west_wing_pharmacy.id, trackable_id: trackable_2.id)
departure_5 = Departure.create(location_id: west_wing_pharmacy.id, trackable_id: trackable_2.id)

arrival_0.created_at    = 19.minutes.ago
departure_0.created_at  = 11.minutes.ago
arrival_1.created_at    = 11.minutes.ago
departure_1.created_at  = 9.minutes.ago
arrival_2.created_at    = 6.minutes.ago
departure_2.created_at  = 2.minutes.ago

arrival_3.created_at    = 12.minutes.ago
departure_3.created_at  = 5.minutes.ago
arrival_4.created_at    = 5.minutes.ago

arrival_5.created_at    = 44.minutes.ago
departure_4.created_at  = 31.minutes.ago
arrival_6.created_at    = 29.minutes.ago
departure_5.created_at  = 28.minutes.ago

arrival_0.save
departure_0.save
arrival_1.save
departure_1.save
arrival_2.save
departure_2.save

arrival_3.save
departure_3.save
arrival_4.save

arrival_5.save
departure_4.save
arrival_6.save
departure_5.save