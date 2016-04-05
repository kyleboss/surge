class MakeBarcodeReaderIdAndTrackableIdNotNullableInBarcodeScan < ActiveRecord::Migration
  def change
    change_column_null :barcode_scans, :trackable_id, false
    change_column_null :barcode_scans, :barcode_reader_id, false
  end
end
