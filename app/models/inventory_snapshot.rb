class InventorySnapshot < ActiveRecord::Base
  belongs_to :location
  has_many :inventory_snapshot_contents
  has_many :trackables, through: :inventory_snapshot_contents
  validates_presence_of :location_id
  validates_associated :location

  def self.create_snapshot_with_contents(antenna_hardware_identifier, rfid_hardware_identifiers)
    antenna = Antenna.where(hardware_identifier: antenna_hardware_identifier)
    return if antenna.empty?
    new_inventory_snapshot_params   = {location_id: antenna.first.location_id}
    inventory_snapshot              = InventorySnapshot.create!(new_inventory_snapshot_params)
    puts "rfid_hardware_identifiers #{rfid_hardware_identifiers}"
    InventorySnapshotContent.create_many_given_rfids(inventory_snapshot.id, rfid_hardware_identifiers)
    return inventory_snapshot
  end

  def self.get_previous_snapshot(inventory_snapshot)
    return InventorySnapshot.where("created_at < ?", inventory_snapshot.created_at)
               .where("location_id = #{inventory_snapshot.location_id}").order(created_at: :desc).limit(1)
  end

  def self.get_updates_from_previous_snapshot(inventory_snapshot)
    prev_snapshot = self.get_previous_snapshot(inventory_snapshot)
    current_trackable_ids = InventorySnapshotContent.where(inventory_snapshot_id: inventory_snapshot.id).uniq
                                 .pluck(:trackable_id)
    puts "current_trackable_ids #{current_trackable_ids}"
    if (prev_snapshot.present?) # If there is a snapshot from this antenna, create arrivals & departures.
      prev_trackable_ids = InventorySnapshotContent.where(inventory_snapshot_id: prev_snapshot.first.id).uniq
                               .pluck(:trackable_id)
      puts "prev_trackable_ids #{prev_trackable_ids}"
      arrival_trackable_ids = current_trackable_ids - prev_trackable_ids
      departure_trackable_ids = prev_trackable_ids - current_trackable_ids
      puts "arrival_trackable_ids: #{arrival_trackable_ids}"
      Arrival.create_given_trackables_and_location(arrival_trackable_ids, inventory_snapshot.location_id)
      Departure.create_given_trackables_and_location(departure_trackable_ids, inventory_snapshot.location_id)
    else # If this is the first update from the antenna, make all rfids detected as arrivals.
      Arrival.create_given_trackables_and_location(current_trackable_ids, inventory_snapshot.location_id)
    end
  end
end
