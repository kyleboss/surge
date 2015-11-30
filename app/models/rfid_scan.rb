class RfidScan < ActiveRecord::Base
  belongs_to :rfid_reader
  belongs_to :rfid

  def self.scan(rfid_reader_id, rfid_id)
    rfid = Rfid.find_by(rfid_id: rfid_id)
    if (rfid.nil?)
      rfid_params = {rfid_id: rfid_id}
      rfid        = Rfid.create(rfid_params)
    end
    ruby_rfid_reader = RfidReader.find_by(:reader_id => rfid_reader_id)
    rfid_scan_params = {rfid_reader_id: ruby_rfid_reader.id, rfid_id: rfid.id}
    RfidScan.create(rfid_scan_params)
    trackable = Trackable.get_new_unpaired_trackables_given_rfid_reader(rfid_reader_id)
    self.pair_with_rfid(rfid, trackable)
  end

  def self.pair_with_rfid(rfid, trackable)
    if trackable.present?
      RfidTrackablePairing.create({rfid_id: rfid.id, trackable_id: trackable.id})
    end
  end
end
