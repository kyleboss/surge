class MakeBarcodeReaderIdAndRfidReaderIdNotNullableAndAddColumnHospitalIdInRfidReaderBarcodeReaderPairings < ActiveRecord::Migration
  def change
    change_column_null :rfid_reader_barcode_reader_pairings, :barcode_reader_id, false
    change_column_null :rfid_reader_barcode_reader_pairings, :rfid_reader_id, false
  end
end
