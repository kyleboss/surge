class MakeTrackableIdNotNullableInInventorySnapshotContents < ActiveRecord::Migration
  def change
    change_column_null :inventory_snapshot_contents, :trackable_id, false
  end
end
