class Arrival < ActiveRecord::Base
  belongs_to :location
  belongs_to :trackable

  def self.create_given_order_and_antenna(order_id, antenna_id)
    trackable_id  = Trackable.where(:order_id => order_id).select(:id).first
    if (trackable.present?)
      location_id         = Antenna.find(antenna_id).select(:location_id)
      new_arrival_params  = {location_id: location_id, trackable_id: trackable_id}
      self.create(new_arrival_params)
    end
  end

  def self.create_many_given_rfids_and_location(rfid_ids, location_id)
    rfid_ids.each do |rfid_id|
      trackable    = RfidTrackablePairing.get_order_given_rfid(rfid_id)
      arrival_params  = {trackable_id: trackable.first.trackable.id, location_id: location_id}
      self.create(arrival_params)
    end
  end
end
