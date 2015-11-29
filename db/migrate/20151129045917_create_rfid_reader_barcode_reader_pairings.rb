class CreateRfidReaderBarcodeReaderPairings < ActiveRecord::Migration
  def change
    create_table :rfid_reader_barcode_reader_pairings do |t|
      t.references :barcode_reader, index: true, foreign_key: true
      t.references :rfid_reader, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
