class Arrival < ActiveRecord::Base
  include PusherModule
  belongs_to :location
  belongs_to :trackable
  validates_presence_of :location, :trackable
  validates_associated :location, :trackable

  def self.create_given_trackables_and_location(trackable_ids, location_id)
    location = Location.find(location_id)
    hospital_id = location.hospital_id
    location_name = location.name

    trackable_ids.each do |trackable_id|
      arrival_params = {trackable_id: trackable_id, location_id: location_id}
      self.create(arrival_params)
      PusherModule.pusher_pub(hospital_id, trackable_id, location_name, :arrival)
    end
  end

end
