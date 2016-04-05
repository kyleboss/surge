json.array!(@barcodes) do |barcode|
  json.extract! barcode, :id, :hardware_identifier
  json.url barcode_url(barcode, format: :json)
end
