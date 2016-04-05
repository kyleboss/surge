class Rfid < ActiveRecord::Base
  has_many :rfid_scans
  has_many :rfid_trackable_pairings
  validates_presence_of :hardware_identifier

  def self.new_unpaired_compatible_rfids(barcode_reader_id)
    compatible_rfid_readers = RfidReaderBarcodeReaderPairing.where(barcode_reader_id: barcode_reader_id).uniq
                                  .pluck(:rfid_reader_id)
    already_paired_rfids = RfidTrackablePairing.uniq.pluck(:rfid_id)
    RfidScan.where(created_at: 5.seconds.ago..Time.now).where.not(rfid_id: already_paired_rfids)
        .where(rfid_reader_id: compatible_rfid_readers).order(:created_at)
  end

  def self.get_trackable_rfid_tracks(hardware_id)
    rfid = Rfid.find_by(:hardware_id => hardware_id)
    return RfidTrackablePairing.find_by(:rfid_id => rfid.id)
  end

end
