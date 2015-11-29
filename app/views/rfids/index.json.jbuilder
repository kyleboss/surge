json.array!(@rfids) do |rfid|
  json.extract! rfid, :id, :uniq_id
  json.url rfid_url(rfid, format: :json)
end
