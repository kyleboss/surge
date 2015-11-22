json.array!(@departures) do |departure|
  json.extract! departure, :id, :location_id, :trackable_id
  json.url departure_url(departure, format: :json)
end
