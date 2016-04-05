class BarcodeTrackablePairing < ActiveRecord::Base
  belongs_to :barcode
  belongs_to :trackable
  validates_associated :barcode, :trackable
  validates_presence_of :barcode_id, :trackable_id
end
