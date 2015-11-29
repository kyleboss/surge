class RfidTrackablePairing < ActiveRecord::Base
  belongs_to :rfid
  belongs_to :trackable

  def self.get_order_given_rfid(rfid_id)
    return self.joins(:trackables).where("RfidTrackablePairings.rfid_id = " + rfid_id).select("Trackables.order_id")
  end

end
