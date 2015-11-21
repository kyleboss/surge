json.array!(@arrivals) do |arrival|
  json.extract! arrival, :id, :location_id, :trackable_id
  json.url arrival_url(arrival, format: :json)
end
