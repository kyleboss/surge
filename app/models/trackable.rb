class Trackable < ActiveRecord::Base
  belongs_to :patient

  def self.get_new_unpaired_trackables_given_rfid_reader(rfid_reader_id)

    return Trackable.find_by_sql("SELECT * FROM trackables
  INNER JOIN barcode_scans ON trackables.id = barcode_scans.id
  INNER JOIN rfid_reader_barcode_reader_pairings ON rfid_reader_barcode_reader_pairings.barcode_reader_id = barcode_scans.barcode_reader_id
  WHERE rfid_reader_barcode_reader_pairings.rfid_reader_id = " + rfid_reader_id + " AND
  (SELECT COUNT(*) FROM rfid_trackable_pairings WHERE rfid_trackable_pairings.trackable_id = trackables.id) = 0
  ORDER BY barcode_scans.created_at DESC LIMIT 1")
  end
end
