json.array!(@feeders) do |feeder|
  json.extract! feeder, :id
  json.url feeder_url(feeder, format: :json)
end
