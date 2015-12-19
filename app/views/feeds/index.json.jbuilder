json.array!(@feeds) do |feed|
  json.extract! feed, :id, :priority, :feeder_id, :question_id
  json.url feed_url(feed, format: :json)
end
