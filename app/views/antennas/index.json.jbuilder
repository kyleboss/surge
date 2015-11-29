json.array!(@antennas) do |antenna|
  json.extract! antenna, :id, :uniq_id, :location_id
  json.url antenna_url(antenna, format: :json)
end
