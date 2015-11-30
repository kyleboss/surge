class ChangeTrackableIdToRfidIdInInventorySnapshotContents < ActiveRecord::Migration
  def change
    rename_column :inventory_snapshot_contents, :trackable_id, :rfid_id
  end
end
