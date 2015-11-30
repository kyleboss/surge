class InventorySnapshot < ActiveRecord::Base
  belongs_to :location
  belongs_to :rfid

  def self.create_snapshot_with_contents(antenna_id, rfid_ids)
    new_inventory_snapshot_location = Antenna.find(antenna_id).location
    new_inventory_snapshot_params   = {location_id: new_inventory_snapshot_location.id}
    inventory_snapshot              = InventorySnapshot.create(new_inventory_snapshot_params)
    inventory_snapshot_id           = inventory_snapshot.id
    InventorySnapshotContent.create_many_given_rfids(inventory_snapshot_id, rfid_ids)
    return inventory_snapshot
  end

  def self.get_previous_snapshot(inventory_snapshot)
    return InventorySnapshot.where("created_at < ?", inventory_snapshot.created_at)
               .where("location_id = #{inventory_snapshot.location_id}").order(created_at: :desc).limit(1)
  end

  def self.get_updates_from_previous_snapshot(inventory_snapshot)
    prev_snapshot     = self.get_previous_snapshot(inventory_snapshot)
    current_rfid_ids  = InventorySnapshotContent.where(:inventory_snapshot_id => inventory_snapshot.id).pluck(:rfid_id)
    if (prev_snapshot.present?)
      prev_rfid_ids   = InventorySnapshotContent.where(:inventory_snapshot_id => prev_snapshot.first.id).pluck(:rfid_id)
      print "I AM IN HERE"
      arrival_rfids   = current_rfid_ids - prev_rfid_ids
      print "CURRENT RFID"
      print current_rfid_ids
      print "PREV RFID"
      print prev_rfid_ids
      departure_rfids = prev_rfid_ids - current_rfid_ids
      Arrival.create_many_given_rfids_and_location(arrival_rfids, inventory_snapshot.location_id)
      Departure.create_many_given_rfids_and_location(departure_rfids, inventory_snapshot.location_id)
    else
      Arrival.create_many_given_rfids_and_location(current_rfid_ids, inventory_snapshot.location_id)
    end
  end
end
