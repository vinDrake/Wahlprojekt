json.array!(@participations) do |participation|
  json.extract! participation, :id, :complete
  json.url participation_url(participation, format: :json)
end
