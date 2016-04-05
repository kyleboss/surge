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
      Antenna.create(hardware_identifier: antenna_unique_identifier, location_id: new_location.id)
    end
  end
  3.times do |hardware_identifier|
    hardware_identifier += 1
    BarcodeReader.create(hardware_identifier: "#{hospital_id}-#{hardware_identifier}", hospital_id: hospital_id)
    RfidReader.create(hardware_identifier: "#{hospital_id}-#{hardware_identifier}", hospital_id: hospital_id)
  end
  RfidReaderBarcodeReaderPairing.create(barcode_reader_id: 1+(hospital_id-1)*3, rfid_reader_id: 1+(hospital_id-1)*3)
  RfidReaderBarcodeReaderPairing.create(barcode_reader_id: 2+(hospital_id-1)*3, rfid_reader_id: 3+(hospital_id-1)*3)
  RfidReaderBarcodeReaderPairing.create(barcode_reader_id: 3+(hospital_id-1)*3, rfid_reader_id: 2+(hospital_id-1)*3)
  3.times do |patient_id|
    patient_id += 1
    mrn = "#{hospital_id}-#{patient_id}"
    new_patient = Patient.create(name: patient_names[patient_id-1], mrn: mrn, hospital_id: hospital_id)
    3.times do |trackable_id|
      trackable_unique_identifier = "#{hospital_id}-#{patient_id}-#{trackable_id}"
      Trackable.create(patient_id: new_patient.id, admin_dose: "admin_dose", drug_name: "drug_name",
                       brand_name: "brand_name", order_identifier: trackable_unique_identifier,
                       med_identifier: "med_identifier", sig: "sig", admin: "admin")
      Rfid.create(hardware_identifier: "#{hospital_id}-#{patient_id}-#{trackable_id*3}")
    end
  end
end

new_patient = Patient.create(name: "John Mayfield", mrn: "23332502", hospital_id: 1)
t1 = Trackable.create(patient_id: new_patient.id, admin_dose: "5mg", drug_name: "Oxycodone",
                 brand_name: "Oxycontin", order_identifier: "000", med_identifier: "3245342523", sig: "5342523",
                 admin: "Must take OXYCONTIN tablets whole, with enough water to ensure complete swallowing
immediately after placing in the mouth. Must take OXYCONTIN tablets one tablet at a time and must not
pre-soak, lick or otherwise wet the tablet prior to placing in the mouth")
t2 = Trackable.create(patient_id: new_patient.id, admin_dose: "30mg", drug_name: "Nifedipine",
                 brand_name: "Adalat", order_identifier: "001", med_identifier: "4523452345", sig: "74567",
                 admin: "Take on empty stomach")
t3 = Trackable.create(patient_id: new_patient.id, admin_dose: "5mg", drug_name: "Cholestyramine",
                 brand_name: "Questran", order_identifier: "002", med_identifier: "89234057", sig: "3245",
                 admin: "The suggested time of administration is at mealtime but may be modified to avoid
interference with absorption of other medications. Although the recommended dosing schedule is twice
daily, QUESTRAN may be administered in 1–6 doses per day. QUESTRAN should not be taken in its dry form.
Always mix QUESTRAN with water or other fluids before ingesting.")

br = BarcodeReader.create(hardware_identifier: "br1", hospital_id: 1)
rr = RfidReader.create(hardware_identifier: "rr1", hospital_id: 1)
RfidReaderBarcodeReaderPairing.create(barcode_reader_id: br.id, rfid_reader_id: rr.id)

Antenna.create(hardware_identifier: "ant1", location_id: 1)
Antenna.create(hardware_identifier: "ant2", location_id: 1)
Antenna.create(hardware_identifier: "ant3", location_id: 2)
Antenna.create(hardware_identifier: "ant4", location_id: 2)
Antenna.create(hardware_identifier: "ant5", location_id: 3)
Rfid.create(hardware_identifier: "rfid1")
Rfid.create(hardware_identifier: "rfid2")
Rfid.create(hardware_identifier: "rfid3")

Barcode.create(code: "bar1")
Barcode.create(code: "bar2")
Barcode.create(code: "bar3")

BarcodeTrackablePairing.create(barcode_id: 1, trackable_id: t1.id)
BarcodeTrackablePairing.create(barcode_id: 2, trackable_id: t2.id)
BarcodeTrackablePairing.create(barcode_id: 3, trackable_id: t3.id)

Location.create(name: "Main Pharmacy", hospital_id: 1)
Location.create(name: "East Wing Pharmacy", hospital_id: 1)
Location.create(name: "West Wing Pharmacy", hospital_id: 1)