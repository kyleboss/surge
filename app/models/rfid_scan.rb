class RfidScan < ActiveRecord::Base
  belongs_to :rfid_reader
  belongs_to :rfid

  def self.scan(rfid_reader_id, uniq_id) 
    if (Rfid.count(:conditions => { :uniq_id => uniq_id }) > 0) 
      rfid = Rfid.find_by(uniq_id: uniq_id) 
    else
      rfid_params = {uniq_id: uniq_id} 
      rfid        = Rfid.create(rfid_params) 
    end 
    short_range_rfid_scan_params = {short_range_rfid_reader_id: rfid_reader_id, rfid_id: rfid.id} 
    ShortRangeRfidScan.create(short_range_rfid_scan_params)
    trackable = Trackable.get_new_unpaired_trackables_given_rfid_reader(rfid_reader_id) 
    self.pair_with_rfid(rfid, trackable)
  end  

  def self.pair_with_rfid(rfid, trackable) 
    if (trackable.present?) 
      RfidTrackablePairing.create(rfid_id: rfid.id, trackable_id: trackable.id) 
    end
  end

end
