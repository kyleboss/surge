class Trackable < ActiveRecord::Base
  belongs_to :patient
  has_many :barcode_scans
  has_many :departures
  has_many :inventory_snapshot_contents
  has_many :rfid_trackable_pairings
  has_one :rfid, through: :rfid_trackable_pairings
  validates_associated :patient
  validates_numericality_of :patient_id, allow_nil: true


  def self.unpaired_trackables
    paired_trackables = RfidTrackablePairing.uniq.pluck(:trackable_id)
    Trackable.where.not(id: paired_trackables)
  end
end
