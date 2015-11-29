class CreateRfidTrackablePairings < ActiveRecord::Migration
  def change
    create_table :rfid_trackable_pairings do |t|
      t.references :rfid, index: true, foreign_key: true
      t.references :trackable, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
