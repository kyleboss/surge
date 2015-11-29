class BarcodeScan < ActiveRecord::Base
  belongs_to :barcode_reader
  belongs_to :trackable

  def self.scan(barcode_reader_id, order_id, mrn, patient_name, admin_dose, drug_name, brand_name, med_id, admin, sig)
    if (Trackable.count(:conditions => { :order_id => order_id }) > 0)
      trackable = Trackable.find_by(order_id: order_id)
    else
      if (Patient.count(:conditions => { :mrn => mrn }) > 0)
        patient = Patient.find_by(mrn: mrn)
      else
        hospital  = BarcodeReader.find(barcode_reader_id).hospital_id
        patient   = Patient.create({mrn: mrn, name: patient_name, hospital_id: hospital})
      end
      trackable_params  = {order_id: order_id, patient_id: patient.id, admin_dose: admin_dose, drug_name: drug_name,
                           brand_name: brand_name, med_id: med_id, admin: admin, sig: sig}
      trackable         = Trackable.create(trackable_params)
    end
    BarcodeScan.create({barcode_reader_id: barcode_reader_id, trackable_id: trackable.id})
    self.pair_with_rfid(barcode_reader_id, trackable)
  end

  def self.pair_with_rfid(barcode_reader_id, trackable)
    rfid = Rfid.get_new_unpaired_rfids_given_barcode_reader(barcode_reader_id)
    if (rfid.present?)
      RfidTrackablePairing.create(rfid_id: rfid.id, trackable_id: trackable.id)
    end
  end
end
