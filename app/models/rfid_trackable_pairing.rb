class RfidTrackablePairing < ActiveRecord::Base
  belongs_to :rfid
  belongs_to :trackable

  def self.get_order_given_rfid(rfid_id)
    print "RFIDDDD"
    print rfid_id
    return RfidTrackablePairing.find_by_sql("SELECT * FROM rfid_trackable_pairings
INNER JOIN trackables ON rfid_trackable_pairings.trackable_id = trackables.id
WHERE rfid_trackable_pairings.rfid_id = #{rfid_id}")
  end

end
