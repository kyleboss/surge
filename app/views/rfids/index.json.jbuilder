json.array!(@rfids) do |rfid|
  json.extract! rfid, :id, :hardware_id
  json.url rfid_url(rfid, format: :json)
end
