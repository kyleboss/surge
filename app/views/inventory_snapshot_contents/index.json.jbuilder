json.array!(@inventory_snapshot_contents) do |inventory_snapshot_content|
  json.extract! inventory_snapshot_content, :id, :inventory_snapshot_id, :trackable_id
  json.url inventory_snapshot_content_url(inventory_snapshot_content, format: :json)
end
