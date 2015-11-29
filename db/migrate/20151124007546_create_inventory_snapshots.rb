class CreateInventorySnapshots < ActiveRecord::Migration
  def change
    create_table :inventory_snapshots do |t|
      t.references :location, index: true, foreign_key: true
      t.references :rfid, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
