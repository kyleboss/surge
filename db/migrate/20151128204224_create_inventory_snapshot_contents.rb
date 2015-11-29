class CreateInventorySnapshotContents < ActiveRecord::Migration
  def change
    create_table :inventory_snapshot_contents do |t|
      t.references :inventory_snapshot, index: true, foreign_key: true
      t.references :trackable, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
