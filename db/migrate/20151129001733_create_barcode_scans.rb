class CreateBarcodeScans < ActiveRecord::Migration
  def change
    create_table :barcode_scans do |t|
      t.references :barcode_reader, index: true, foreign_key: true
      t.references :trackable, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
