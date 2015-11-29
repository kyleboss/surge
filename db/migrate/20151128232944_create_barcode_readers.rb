class CreateBarcodeReaders < ActiveRecord::Migration
  def change
    create_table :barcode_readers do |t|
      t.string :reader_id

      t.timestamps null: false
    end
  end
end
