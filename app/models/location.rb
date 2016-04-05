class Location < ActiveRecord::Base
  belongs_to :hospital
  has_many :antennas
  has_many :departures
  has_many :inventory_snapshots
  validates_presence_of :name, :hospital_id
  validates_associated :hospital

end
