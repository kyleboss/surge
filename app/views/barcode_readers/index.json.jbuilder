json.array!(@barcode_readers) do |barcode_reader|
  json.extract! barcode_reader, :id, :reader_id
  json.url barcode_reader_url(barcode_reader, format: :json)
end
