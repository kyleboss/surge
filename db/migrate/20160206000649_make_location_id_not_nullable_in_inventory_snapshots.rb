class MakeLocationIdNotNullableInInventorySnapshots < ActiveRecord::Migration
  def change
    change_column_null :inventory_snapshots, :location_id, false
  end
end
