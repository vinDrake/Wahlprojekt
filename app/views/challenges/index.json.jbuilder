json.array!(@challenges) do |challenge|
  json.extract! challenge, :id, :name, :alive, :max_challenge_time, :latest_end, :strict_order, :strikes
  json.url challenge_url(challenge, format: :json)
end
