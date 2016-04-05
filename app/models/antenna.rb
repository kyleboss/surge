class Antenna < ActiveRecord::Base
  belongs_to :location
  validates_presence_of :location, :hardware_identifier
  validates_associated :location

  def hospital
    location = Location.find(location_id)
    location.hospital_id
  end

  def self.hospital(antenna_id)
    antenna = Antenna.find(antenna_id)
    location = Location.find(antenna.location_id)
    location.hospital_id
  end
end
