class CreateBarcodes < ActiveRecord::Migration
  def change
    create_table :barcodes do |t|
      t.string :hardware_identifier, null: false

      t.timestamps null: false
    end
  end
end
