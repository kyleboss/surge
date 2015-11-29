json.array!(@rfid_readers) do |rfid_reader|
  json.extract! rfid_reader, :id, :reader_id
  json.url rfid_reader_url(rfid_reader, format: :json)
end
