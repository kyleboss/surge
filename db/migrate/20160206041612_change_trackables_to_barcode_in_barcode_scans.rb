class ChangeTrackablesToBarcodeInBarcodeScans < ActiveRecord::Migration
  def change
    remove_column :barcode_scans, :trackable_id
    add_reference :barcode_scans, :barcode, index: true, foreign_key: true, null: false
  end
end
