class BarcodeReader < ActiveRecord::Base
  belongs_to :hospital
  has_many :barcode_scans
  has_many :rfid_reader_barcode_reader_pairings
  validates_presence_of :hospital, :hardware_identifier
  validates_associated :hospital
end
