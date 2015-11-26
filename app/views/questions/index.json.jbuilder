json.array!(@questions) do |question|
  json.extract! question, :id, :problem
  json.url question_url(question, format: :json)
end
