json.array!(@rfid_scans) do |rfid_scan|
  json.extract! rfid_scan, :id, :rfid_reader_id, :rfid_id
  json.url rfid_scan_url(rfid_scan, format: :json)
end
