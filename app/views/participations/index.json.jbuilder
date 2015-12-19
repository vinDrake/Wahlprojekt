json.array!(@participations) do |participation|
  json.extract! participation, :id, :complete, :user_id, :challenge_id, :succeeded, :strikes
  json.url participation_url(participation, format: :json)
end
