json.array!(@pills) do |pill|
  json.extract! pill, :id, :drug_id, :brand_id, :location_id, :hospital_id, :qty
  json.url pill_url(pill, format: :json)
end
