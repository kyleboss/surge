class CreateRfidScans < ActiveRecord::Migration
  def change
    create_table :rfid_scans do |t|
      t.references :rfid_reader, index: true, foreign_key: true
      t.references :rfid, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
