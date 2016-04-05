class BarcodeScan < ActiveRecord::Base
  belongs_to :barcode_reader
  belongs_to :barcode
  validates_presence_of :barcode_reader, :barcode
  validates_associated :barcode, :barcode_reader

  def self.scan(barcode_reader_hardware_identifier, barcode_code)
    return if (barcode_code.nil? || barcode_reader_hardware_identifier.nil?)
    barcode = Barcode.find_by(code: barcode_code)
    return if barcode.nil?
    barcode_reader = BarcodeReader.find_by(hardware_identifier: barcode_reader_hardware_identifier)
    return if barcode_reader.nil? || barcode.nil?
    barcode_scan = BarcodeScan.new({barcode_id: barcode.id, barcode_reader_id: barcode_reader.id})
    if barcode_scan.save()
      trackable = Barcode.trackable(barcode.id)
      return nil if (trackable.nil?)
      BarcodeScan.connect_with_rfid_scan(barcode_reader.id, trackable)
    end
  end

  def self.connect_with_rfid_scan(barcode_reader_id, trackable_id)
    puts "trackable_id #{trackable_id}"
    rfid = Rfid.new_unpaired_compatible_rfids(barcode_reader_id)
    if (rfid.present?)
      RfidTrackablePairing.create!(rfid_id: rfid.first.rfid_id, trackable_id: trackable_id)
    end
  end
end
