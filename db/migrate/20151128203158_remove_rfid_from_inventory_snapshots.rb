class RemoveRfidFromInventorySnapshots < ActiveRecord::Migration
  def change
    remove_reference :inventory_snapshots, :rfid, index: true, foreign_key: true
  end
end
