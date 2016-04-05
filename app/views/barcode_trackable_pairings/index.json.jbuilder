json.array!(@barcode_trackable_pairings) do |barcode_trackable_pairing|
  json.extract! barcode_trackable_pairing, :id, :barcode_id, :trackable_id
  json.url barcode_trackable_pairing_url(barcode_trackable_pairing, format: :json)
end
