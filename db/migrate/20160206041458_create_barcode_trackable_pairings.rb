class CreateBarcodeTrackablePairings < ActiveRecord::Migration
  def change
    create_table :barcode_trackable_pairings do |t|
      t.references :barcode, index: true, foreign_key: true, null: false
      t.references :trackable, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
