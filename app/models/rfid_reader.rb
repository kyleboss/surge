class RfidReader < ActiveRecord::Base
  has_many :rfid_reader_barcode_reader_pairings
  has_many :barcode_readers, through: :rfid_reader_barcode_reader_pairings
  has_many :rfid_scans, through: :rfid_reader_barcode_reader_pairings
  belongs_to :hospital
  validates_presence_of :hospital, :hardware_identifier
  validates_associated :hospital
end
