class RfidScan < ActiveRecord::Base
  belongs_to :rfid_reader
  belongs_to :rfid
  validates_associated :rfid_reader, :rfid
  validates_presence_of :rfid_reader, :rfid

  def self.scan(rfid_reader_hardware_identifier, rfid_hardware_identifier)
    return if (rfid_reader_hardware_identifier.nil? || rfid_hardware_identifier.nil?)
    rfid = Rfid.find_or_create_by(hardware_identifier: rfid_hardware_identifier)
    rfid_reader = RfidReader.find_by(hardware_identifier: rfid_reader_hardware_identifier)
    return if rfid_reader.nil? || rfid.nil?
    rfid_scan = RfidScan.new({rfid_id: rfid.id, rfid_reader_id: rfid_reader.id})
    if rfid_scan.save()
      RfidScan.connect_with_barcode_scan(rfid_reader.id, rfid.id)
    end
  end

  def self.connect_with_barcode_scan(rfid_reader_id, rfid_id)
    puts "RFID_ID: #{rfid_id}"
    barcode_id = Barcode.new_unpaired_compatible_barcodes(rfid_reader_id)
    trackable = Barcode.trackable(barcode_id)
    return if trackable.nil?
    RfidTrackablePairing.create!(rfid_id: rfid_id, trackable_id: trackable)
  end

  def self.most_recent_unpaired_rfid(barcode_reader_id)
    all_paired_rfids = RfidTrackablePairing.all_paired_rfids_from_compatible_barcode_readers(barcode_reader_id)
    RfidScan.select(:rfid_id).where(created_at: (Time.now - 5.seconds)..Time.now)
        .where.not(rfid_if: all_paired_rfids).order(:created_at).first
  end

end
