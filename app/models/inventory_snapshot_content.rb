class InventorySnapshotContent < ActiveRecord::Base
  belongs_to :inventory_snapshot
  belongs_to :trackable
  validates_presence_of :inventory_snapshot_id, :trackable_id
  validates_associated :trackable, :inventory_snapshot

  def self.create_many_given_rfids(inventory_snapshot_id, rfid_hardware_identifiers)
    rfid_hardware_identifiers.each do |rfid_hardware_identifier|
      rfid = Rfid.find_by(hardware_identifier: rfid_hardware_identifier)
      return if rfid.nil?
      rfid_trackable_pairing = RfidTrackablePairing.find_by(rfid_id: rfid.id)
      return if rfid_trackable_pairing.nil?
      new_inventory_snapshot_content_params = {
          inventory_snapshot_id: inventory_snapshot_id,
          trackable_id: rfid_trackable_pairing.trackable_id
      }
      puts "new_inventory_snapshot_content_params #{new_inventory_snapshot_content_params}"
      InventorySnapshotContent.create!(new_inventory_snapshot_content_params)
    end
  end
end
