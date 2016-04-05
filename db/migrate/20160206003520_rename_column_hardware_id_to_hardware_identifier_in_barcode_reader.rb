class RenameColumnHardwareIdToHardwareIdentifierInBarcodeReader < ActiveRecord::Migration
  def change
    rename_column :barcode_readers, :hardware_id, :hardware_identifier
  end
end
