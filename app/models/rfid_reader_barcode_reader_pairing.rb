class RfidReaderBarcodeReaderPairing < ActiveRecord::Base
  belongs_to :barcode_reader
  belongs_to :rfid_reader
end
