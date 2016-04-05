json.array!(@rfid_reader_barcode_reader_pairings) do |rfid_reader_barcode_reader_pairing|
  json.extract! rfid_reader_barcode_reader_pairing, :id, :barcode_reader_hardware_id, :rfid_reader_id
  json.url rfid_reader_barcode_reader_pairing_url(rfid_reader_barcode_reader_pairing, format: :json)
end
