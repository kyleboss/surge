class ChangeReaderToHardwareInBarcodeReaders < ActiveRecord::Migration
  def change
    rename_column :barcode_readers, :reader_id, :hardware_id
  end
end
