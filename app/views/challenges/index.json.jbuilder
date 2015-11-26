json.array!(@challenges) do |challenge|
  json.extract! challenge, :id, :name, :alive
  json.url challenge_url(challenge, format: :json)
end
