class Rfid < ActiveRecord::Base

  def self.get_new_unpaired_rfids_given_barcode_reader(barcode_reader_id)
    return Rfid.find_by_sql("SELECT rfids.id FROM rfids
  INNER JOIN rfid_scans ON rfids.id = rfid_scans.rfid_id
  INNER JOIN rfid_reader_barcode_reader_pairings ON rfid_reader_barcode_reader_pairings.rfid_reader_id = rfid_scans.rfid_reader_id
  WHERE rfid_reader_barcode_reader_pairings.barcode_reader_id = #{barcode_reader_id} AND
  (SELECT COUNT(*) FROM rfid_trackable_pairings WHERE rfid_trackable_pairings.rfid_id = Rfids.id) = 0
  AND rfid_scans.created_at > NOW() - INTERVAL '5 seconds'
  ORDER BY rfid_scans.created_at DESC LIMIT 1")
  end

  def self.get_trackable_rfid_tracks(rfid_id)
    rfid = Rfid.find_by(:rfid_id => rfid_id)
    return RfidTrackablePairing.find_by(:rfid_id => rfid.id)
  end

end
