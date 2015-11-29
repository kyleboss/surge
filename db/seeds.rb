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
    BarcodeReader.create(reader_id: reader_id, hospital_id: hospital_id)
    RfidReader.create(reader_id: reader_id, hospital_id: hospital_id)
  end
  RfidReaderBarcodeReaderPairing.create(barcode_reader_id: 1+hospital_id-1, rfid_reader_id: 1+hospital_id-1)
  RfidReaderBarcodeReaderPairing.create(barcode_reader_id: 2+hospital_id-1, rfid_reader_id: 3+hospital_id-1)
  RfidReaderBarcodeReaderPairing.create(barcode_reader_id: 3+hospital_id-1, rfid_reader_id: 2+hospital_id-1)
  3.times do |patient_id|
    patient_id += 1
    mrn_identifier = "#{hospital_id}-#{patient_id}"
    new_patient = Patient.create(name: patient_names[patient_id-1], mrn: mrn_identifier, hospital_id: hospital_id)
    3.times do |trackable_id|
      trackable_unique_identifier = "#{hospital_id}-#{patient_id}-#{trackable_id}"
      Trackable.create(patient_id: new_patient.id, admin_dose: "admin_dose", drug_name: "drug_name",
                       brand_name: "brand_name", order_id: trackable_unique_identifier, med_id: "med_id")
      Rfid.create(uniq_id: "#{hospital_id}-#{patient_id}-#{trackable_id*3}")
    end
  end
end