json.array!(@inventory_snapshots) do |inventory_snapshot|
  json.extract! inventory_snapshot, :id, :location_id, :rfid_id
  json.url inventory_snapshot_url(inventory_snapshot, format: :json)
end
