class InventorySnapshotContent < ActiveRecord::Base
  belongs_to :inventory_snapshot
  belongs_to :trackable

  def self.create_many_given_rfids(inventory_snapshot_id, rfid_ids)
    rfid_ids.each do |rfid_id|
      new_inventory_snapshot_content_params = {inventory_snapshot_id: inventory_snapshot_id, rfid_id: rfid_id}
      InventorySnapshotContent.create(new_inventory_snapshot_content_params)
    end
  end
end
