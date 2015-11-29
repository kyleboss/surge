json.array!(@barcode_scans) do |barcode_scan|
  json.extract! barcode_scan, :id, :barcode_reader_id, :trackable_id
  json.url barcode_scan_url(barcode_scan, format: :json)
end
