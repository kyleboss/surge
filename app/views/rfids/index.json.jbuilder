json.array!(@rfids) do |rfid|
  json.extract! rfid, :id, :rfid_id
  json.url rfid_url(rfid, format: :json)
end
