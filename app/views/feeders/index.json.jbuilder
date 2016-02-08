json.array!(@feeders) do |feeder|
  json.extract! feeder, :id, :user_id, :created_at, :updated_at, :get_next_feed, :get_next_question_id, :get_next_prio_0_feed, :get_next_prio_0_question_id
  json.url feeder_url(feeder, format: :json)
end
