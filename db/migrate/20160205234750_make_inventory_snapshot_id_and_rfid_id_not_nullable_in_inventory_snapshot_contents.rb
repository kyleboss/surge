class MakeInventorySnapshotIdAndRfidIdNotNullableInInventorySnapshotContents < ActiveRecord::Migration
  def change
    change_column_null :inventory_snapshot_contents, :inventory_snapshot_id, false
    change_column_null :inventory_snapshot_contents, :rfid_id, false
  end
end
