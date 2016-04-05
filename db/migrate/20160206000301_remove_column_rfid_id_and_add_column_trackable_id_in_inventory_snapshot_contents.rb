class RemoveColumnRfidIdAndAddColumnTrackableIdInInventorySnapshotContents < ActiveRecord::Migration
  def change
    remove_column :inventory_snapshot_contents, :rfid_id
    add_column :inventory_snapshot_contents, :trackable_id, :integer, references: :trackables
  end
end
