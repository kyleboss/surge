class InventorySnapshot < ActiveRecord::Base
  belongs_to :location
  belongs_to :rfid

  def self.create_snapshot_with_contents(antenna_id, rfid_ids)
    new_inventory_snapshot_location = Antenna.find(antenna_id).location
    new_inventory_snapshot_params   = {location_id: new_inventory_snapshot_location}
    inventory_snapshot              = InventorySnapshot.create(new_inventory_snapshot_params)
    inventory_snapshot_id           = inventory_snapshot.id
    InventorySnapshotContent.create_many_given_rfids(inventory_snapshot_id, rfid_ids)
  end

  def get_previous_snapshot()
    return self.where("created_at < " + self.created_at + " AND location_id = " + self.location_id).limit(1)
               .order(created_at: :desc)
  end

  def get_updates_from_previous_snapshot()
    prev_snapshot     = self.get_previous_snapshot()
    current_rfid_ids  = InventorySnapshotContent.where(:inventory_snapshot_id => self.id).pluck(:rfid_id)
    if (prev_snapshot.present?)
      prev_rfid_ids   = InventorySnapshotContent.where(:inventory_snapshot_id => prev_snapshot.id).pluck(:rfid_id)
      arrival_rfids   = current_rfid_ids - prev_rfid_ids
      departure_rfids = prev_rfid_ids - current_rfid_ids
      Arrival.create_many_given_rfids_and_location(arrival_rfids, location_id)
      Departure.create_many_given_rfids_and_location(departure_rfids, location_id)
    else
      Arrival.create_many_given_rfids_and_location(current_rfid_ids, location_id)
    end
  end
end
