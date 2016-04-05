class RfidReaderBarcodeReaderPairing < ActiveRecord::Base
  belongs_to :barcode_reader
  belongs_to :rfid_reader
  has_many :rfids, through: :rfid_scans
  validates_associated :barcode_reader, :rfid_reader
  validates_presence_of :rfid_reader, :barcode_reader
end
